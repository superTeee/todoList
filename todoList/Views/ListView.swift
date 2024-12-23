import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var lvm: ListViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    if lvm.items.isEmpty {
                        EmptyListView(showSheet: $showSheet)
                    } else {
                        List {
                            ForEach(lvm.items) { item in
                                ListRowView(item: item)
                                    .onTapGesture {
                                        lvm.updateItem(item: item)
                                    }
                            }
                            .onDelete(perform: lvm.deleteItem)
                            .onMove(perform: lvm.moveItem)
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationTitle("My ToDo´s")
                .toolbar {
                    if !lvm.items.isEmpty {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                }

                HStack {
                    Spacer()
                    if !lvm.items.isEmpty {
                        // ADD button
                        AddButtonView(showSheet: $showSheet)
                    }
                }
                .padding(.horizontal, 48)
                .padding(.bottom, 32)
            }
        }
        .sheet(isPresented: $showSheet, content: {
            AddView()
                .presentationDetents([.height(264)])
                .presentationCornerRadius(16)
        })
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
