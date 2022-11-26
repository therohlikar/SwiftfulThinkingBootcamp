//
//  ListBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/26/22.
//

import SwiftUI

struct ListBootcamp: View {
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: removeRow)
                    .onMove { indexSet, newIndex in
                        fruits.move(fromOffsets: indexSet, toOffset: newIndex)
                    }
                    .listRowBackground(
                        Color.pink
                    )
                } header: {
                    Text("Fruits")
                }
                
                Section {
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies.capitalized)
                    }
                } header: {
                    Text("Veggies")
                }

            }
            //.listStyle(SidebarListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton
                }
            }
        }
        .tint(Color.black)
    }
    
    var addButton: some View{
        Button {
            addRow(newRowString: "coconut")
        } label: {
            Text("Add")
        }

    }
    
    func addRow(newRowString: String){
        fruits.append(newRowString)
    }
    
    func removeRow(indexSet: IndexSet){
        fruits.remove(atOffsets: indexSet)
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
