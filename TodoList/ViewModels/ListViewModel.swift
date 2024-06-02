//
//  ListViewModel.swift
//  TodoList
//
//  Created by Nguyen Quang Minh on 2/6/24.
//

import Foundation

/*
 CRUD FUNCTIONS
 */

class ListViewModel : ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"

    init(){
        getItems()
    }

    func getItems(){
        //        let newItems = [
        //            ItemModel(title: "Buy milk", isCompleted: false),
        //            ItemModel(title: "Go to the gym", isCompleted: true),
        //        ]
        //
        //        items.append(contentsOf: newItems)

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}

        self.items = saveItems

    }

    func deleteItems(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }

    func moveItems(from source: IndexSet, to destination: Int){
        items.move(fromOffsets: source, toOffset: destination)
    }

    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ItemModel) {
        //        if let index = items.firstIndex { (existingItem) -> Bool in
        //            return existingItem.id == item.id
        //        } {
        //
        //        }

        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }

    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

}
