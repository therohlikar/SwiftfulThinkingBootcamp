//
//  EnvironmentObjectBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 12/8/22.
//

import SwiftUI



class EnvironmentViewModel: ObservableObject{
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData(){
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObjectBootcamp: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { device in
                    NavigationLink {
                        ItemView(selectedItem: device)
                    } label: {
                        Text(device)
                    }

                }
            }.navigationTitle("iOS Devices")
        }
        .tint(.white)
        .environmentObject(viewModel)
    }
}

struct ItemView: View {
    let selectedItem: String
    
    var body: some View{
        ZStack{
            // background
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                DetailView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct DetailView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View{
        ZStack{
            //background
            Color.gray.ignoresSafeArea()
            
            // foreground
            ScrollView{
                VStack(spacing: 20){
                    ForEach(viewModel.dataArray, id: \.self) { device in
                        Text(device)
                            .frame(width: 200)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                }
                .foregroundColor(.black)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
    }
}
