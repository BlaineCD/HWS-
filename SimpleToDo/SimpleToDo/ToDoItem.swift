//
//  ToDoItem.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 4/30/22.
//

import Foundation

struct ToDoItem: Codable, Identifiable, Hashable {
    enum Priority: String, Codable, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }

    var id = UUID()
    var title = "New Item"
    var priority = Priority.medium
    var isComplete = false

    var icon: String {
        if isComplete {
            return "checkmark.square"
        } else {
            switch priority {
            case .low:
                return "arrow.down.square"
            case .medium:
                return "square"
            default:
                return "exclamationmark.square"
            }
        }
    }

    static let example = ToDoItem()
}
