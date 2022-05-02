//
//  FileManager-DocumentsDirectory.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 4/30/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
