//
//  SelectSomethingView.swift
//  SimpleNews
//
//  Created by Blaine Dannheisser on 6/1/22.
//

import SwiftUI

struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "newspaper")
                .font(.largeTitle)
                .foregroundColor(.accentColor)

            Text("Welcome To SimpleNews!")
                .font(.title)

            Text("Please select an item to view")

            Text("All text in this app was served up from the Guardian API via Hacking with Swift and all copyright belongs to Guardian News. This feed may go away at anytime.")
        }
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}
