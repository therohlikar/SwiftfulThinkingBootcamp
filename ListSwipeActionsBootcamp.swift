//
//  ListSwipeActionsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/10/22.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self){
                Text($0.capitalized)
                
            }
            .swipeActions(edge: .leading) {
                Button {
                    
                } label: {
                    Image(systemName: "archivebox")
                }
                .tint(.green)
            }
            .swipeActions(edge: .trailing) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .tint(.yellow)
            }
        }
    }
    
    func delete(indexSet: IndexSet){
        
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}
