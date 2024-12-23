//
//  ListRowView.swift
//  todoList
//
//  Created by Tom erik Heggedal on 07/12/2024.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
            HStack (spacing: 12){
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle( item.isCompleted ? Color.accentColor : .gray.opacity(0.5))
                    .font(.title)
                Text(item.itemTitle)
                    .foregroundStyle(item.isCompleted ? .gray : .primary)
                    //.strikethrough(item.isCompleted, color: .gray)
                Spacer()
            }
            .background(.clear)
            .padding(.vertical, 8)
        }
    }






#Preview (traits: .sizeThatFitsLayout){
    ListRowView(item: ItemModel(itemTitle: "This is an item", isCompleted: true))
    ListRowView(item: ItemModel(itemTitle: "This is an item", isCompleted: false))
    
}

