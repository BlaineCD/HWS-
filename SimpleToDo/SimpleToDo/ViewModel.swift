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

    /// An active Combine chain that watches for changes to the `items` array, and calls save()
    /// 5 seconds after a change has happened.
    private var saveSubscription: AnyCancellable?

    init() {
        do {
            let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            items = []
        }

        // Wait 5 seconds after `items` has changed before calling `save()`, to
        // avoid repeatedly calling it for every tiny change.
        saveSubscription = $items
            .debounce(for: 5, scheduler: RunLoop.main)
            .sink { [weak self] _ in
                self?.save()
            }
    }

    func save() {
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
