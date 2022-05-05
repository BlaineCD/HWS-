//
//  SimpleScoresApp.swift
//  SimpleScores
//
//  Created by Blaine Dannheisser on 5/4/22.
//

import SwiftUI

@main
struct SimpleScoresApp: App {
    @StateObject var model = ViewModel()
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(model: model)
            }
            .navigationViewStyle(.stack)
            .preferredColorScheme(.dark)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                model.save()
            }
        }
    }
}
