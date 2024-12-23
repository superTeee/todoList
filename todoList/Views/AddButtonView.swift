//
//  AddButtonView.swift
//  todoList
//
//  Created by Tom erik Heggedal on 19/12/2024.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var showSheet: Bool
    
    var body: some View {
        Button {
            showSheet.toggle()
        } label: {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 64, height: 64)
                .overlay {
                    Image(systemName: "plus")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    AddButtonView(showSheet: .constant(false))
}
