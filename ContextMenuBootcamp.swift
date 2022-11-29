//
//  ContextMenuBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/29/22.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var bgColor: Color = .orange
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0){
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .padding()
        .background(bgColor)
        .cornerRadius(12)
        .contextMenu {
            Button {
                bgColor = .red
            } label: {
                Label("Share", systemImage: "envelope.fill")
            }
            
            Button {
                bgColor = .yellow
            } label: {
                Label("Like", systemImage: "heart.fill")
            }
            
            Button {
                bgColor = .brown
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }

        }
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
