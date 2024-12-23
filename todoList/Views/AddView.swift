//
//  AddView.swift
//  todoList
//
//  Created by Tom erik Heggedal on 07/12/2024.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var lvm: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack (spacing: 32){
            HStack {
                Text("Add item")
                    .font(.title)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.black)
                }

            }
            .padding(4)

            VStack (spacing: 24){
                TextField("What to do...", text: $textFieldText)
                    .padding()
                    .background(Color.gray.opacity(0.12))
                    .cornerRadius(100)
                    
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Add item".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color.accentColor)
                        .cornerRadius(100)
                }
            }
            
        }
        .padding(.horizontal, 24)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            lvm.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "At least 3 characters!! 😳"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
        }
    
    }
    

#Preview {
    NavigationStack {
        AddView()
    }
    .environmentObject(ListViewModel())
}
