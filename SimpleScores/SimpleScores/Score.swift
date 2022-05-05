//
//  Score.swift
//  SimpleScores
//
//  Created by Blaine Dannheisser on 5/4/22.
//

import Foundation

struct Score: Codable, Identifiable, Hashable {
    var id = UUID()
    var playerName = "New Player"
    var score = 0
    var color = ColorChoice.blue

    static let example = Score() 
}
