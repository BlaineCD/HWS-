//
//  ContentView.swift
//  SimpleNews
//
//  Created by Blaine Dannheisser on 6/1/22.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    enum LoadState {
        case loading, success, failed
    }

    @State private var articles = [Article]()
    @State private var loadState = LoadState.loading
    @State private var searchText = ""

    var body: some View {
        Group {
            switch loadState {
            case .loading:
                VStack {
                    Text("Downloading...")
                    ProgressView()
                }
            case .success:
                List(filteredArticles, rowContent: ArticleRow.init)
            case .failed:
                VStack {
                    Text("Failed to download the news")

                    Button("Retry") {
                        loadState = .loading

                        Task {
                            try await Task.sleep(nanoseconds: 500_000_000)
                            await downloadArticles()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .navigationTitle("SimpleNews")
        .task(downloadArticles)
        .refreshable(action: downloadArticles)
        .searchable(text: $searchText)
    }

    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    // MARK: Internal

    @Sendable func downloadArticles() async {
        do {
            let url = URL(string: "https://hws.dev/news")!
            let (data, _) = try await URLSession.shared.data(from: url)

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            articles = try decoder.decode([Article].self, from: data).sorted()
            loadState = .success
        } catch {
            loadState = .failed
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
