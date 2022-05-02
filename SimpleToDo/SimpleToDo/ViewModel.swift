//
//  ViewModel.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 4/30/22.
//

import Combine
import Foundation

class ViewModel: ObservableObject {
    @Published var items: [ToDoItem]

    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedItems")

    private var saveSubscriptioin: AnyCancellable?

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            items = []
        }

        saveSubscriptioin = $items
            .debounce(for: 5, scheduler: RunLoop.main)
            .sink{ [weak self] _ in
                self?.save()
            }
    }

    func save() {
        print("Saving")

        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }

    func add() {
        let newItem = ToDoItem()
        items.append(newItem)
    }

    func delete(_ offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func delete(_ selected: Set<ToDoItem>) {
        items.removeAll(where: selected.contains)
    }
}
