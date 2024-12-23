//
//  todoListApp.swift
//  todoList
//
//  Created by Tom erik Heggedal on 07/12/2024.
//

import SwiftUI

// MVVM Architecture
// Model - The datapoint
// View - UI
// ViewModel - Manages models for views

@main
struct todoListApp: App {
    
    @State var lvm: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(lvm)
        }
    }
}
