//
//  SimpleToDoApp.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 4/30/22.
//

import SwiftUI

@main
struct SimpleToDoApp: App {
    @StateObject private var model = ViewModel()
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(model: model)
                SelectSomethingView()
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                model.save()
            }
        }
    }
}
