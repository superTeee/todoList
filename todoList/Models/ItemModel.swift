//
//  ItemModel.swift
//  todoList
//
//  Created by Tom erik Heggedal on 07/12/2024.
//

import Foundation

// Immutable struct

struct ItemModel: Identifiable, Codable {
    let id: String
    let itemTitle: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, itemTitle: String, isCompleted: Bool) {
        self.id = id
        self.itemTitle = itemTitle
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, itemTitle: itemTitle, isCompleted: !isCompleted)
    }
}
