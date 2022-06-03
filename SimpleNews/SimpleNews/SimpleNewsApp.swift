//
//  SimpleNewsApp.swift
//  SimpleNews
//
//  Created by Blaine Dannheisser on 6/1/22.
//

import SwiftUI

@main
struct SimpleNewsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                SelectSomethingView()
            }
        }
    }
}
