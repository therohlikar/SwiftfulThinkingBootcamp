//
//  ViewModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/7/22.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray:[FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Peach", count: 88)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModelBootcamp: View {
    
    //MARK: PROPERTIES
    // @StateObject -> Use this on creation / init
    // @ObservedObject -> Use this for subviews
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    @State var openRandomScreen: Bool = false
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List{
                if fruitViewModel.isLoading {
                    ProgressView()
                }else{
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                                
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .toolbar(content: {
                ToolbarItem(placement:.navigationBarTrailing) {
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .sheet(isPresented: $openRandomScreen){
                            RandomScreen(fruitViewModel: fruitViewModel)                        }
                        .onTapGesture {
                            openRandomScreen.toggle()
                        }
                }
            })
        }
    }
}

struct RandomScreen: View {
    @ObservedObject var fruitViewModel: FruitViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()

            VStack{
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            
        }
    }
}

//MARK: PREVIEW
struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
    }
}
