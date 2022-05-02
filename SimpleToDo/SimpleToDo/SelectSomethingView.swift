//
//  SelectSomethingView.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 5/1/22.
//

import SwiftUI

struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "checkmark.square")
                .font(.largeTitle)
                .foregroundColor(.accentColor)

            Text("Welcome to SimpleToDo!")
                .font(.title)

            Text("Select an item to view!")
        }
    }
}

struct SelectSomethingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSomethingView()
    }
}
