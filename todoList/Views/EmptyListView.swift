//
//  EmptyListView.swift
//  todoList
//
//  Created by Tom erik Heggedal on 19/12/2024.
//

import SwiftUI

struct EmptyListView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack(spacing: 48) {
            Spacer()
            ZStack {
                Circle()
                    .fill(.accent.opacity(0.15))
                Image("well-done")
                    .resizable()
                    .scaledToFit()
                    
            }
            .frame(width: 180)
           
            
            VStack (spacing: 8){
                Text("Well done!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text("You have completed all your tasks")
                    .font(.subheadline)
            }
            
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Add item")
                    .font(.headline)
                    .frame(minWidth: 220, minHeight: 60)
                    .background(Color.accentColor)
                    .cornerRadius(100)
                    .foregroundStyle(.white)
            }
            
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        EmptyListView(showSheet: .constant(false))
            .navigationTitle("My todo´s")
    }
}
