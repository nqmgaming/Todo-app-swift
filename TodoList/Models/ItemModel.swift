//
//  ItemModel.swift
//  TodoList
//
//  Created by Nguyen Quang Minh on 2/6/24.
//

import Foundation

// Immutable model
struct ItemModel : Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateCompletion() ->ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

