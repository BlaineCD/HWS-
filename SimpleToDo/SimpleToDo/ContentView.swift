//
//  ContentView.swift
//  SimpleToDo
//
//  Created by Blaine Dannheisser on 4/30/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var model: ViewModel

    @State private var selectedItems = Set<ToDoItem>()

    @State private var editMode = EditMode.inactive

    var body: some View {
        List(selection: $selectedItems) {
            ForEach($model.items, content: ItemRow.init)
                .onDelete(perform: model.delete)
        }
        .navigationTitle("SimpleToDo")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading, content: EditButton.init)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    model.add()
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
            ToolbarItem(placement: .bottomBar) {
                if editMode == .active {
                    HStack {
                        Spacer()
                        Button(role: .destructive) {
                            model.delete(selectedItems)
                            selectedItems.removeAll()
                        } label: {
                            Label("Delete Selected", systemImage: "trash")
                        }
                        .disabled(selectedItems.isEmpty)
                    }
                }
            }
        }
        .animation(.default, value: model.items)
        .listStyle(.sidebar)
        .environment(\.editMode, $editMode)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ViewModel())
    }
}
