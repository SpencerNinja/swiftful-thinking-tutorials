//
//  ItemModel.swift
//  TodoList
//
//  Created by Spencer Hurd on 1/21/22.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
