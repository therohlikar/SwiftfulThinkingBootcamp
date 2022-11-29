//
//  ActionsheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Radek Jeník on 11/29/22.
//

import SwiftUI

struct ActionsheetBootcamp: View {
    
    @State var showSheet: Bool = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack{
                Circle()
                    .frame(width: 30, height: 30)
                Text("@username")
                Spacer()
                Button {
                    actionSheetOption = .isMyPost
                    showSheet.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .confirmationDialog("TITLE", isPresented: $showSheet, titleVisibility: .hidden) {
            getDialog()
        } message: {
            Text("What would you like to do?")
        }
    }
//
//    func getCustomDialog() -> some View {
//        let shareButton: Button = Button(role: .none, action: {
//
//        }, label: {
//            Text("Share")
//        })
//        let reportButton: Button = Button(role: .destructive, action: {
//
//        }, label: {
//            Text("Report")
//        })
//        let deleteButton: Button = Button(role: .destructive, action: {
//
//        }, label: {
//            Text("Delete")
//        })
//        let cancelButton: Button = Button(role: .cancel, action: {
//
//        }, label: {
//            Text("Cancel")
//        })
//
//        switch actionSheetOption {
//            case .isOtherPost:
//                return Group {
//                    shareButton
//                    reportButton
//                    cancelButton
//                }
//
//            case .isMyPost:
//                return Group {
//                    shareButton
//                    reportButton
//                    deleteButton
//                    cancelButton
//                }
//        }
//
//        return Group {
//            cancelButton
//        }
//    }
    
    @ViewBuilder func getDialog() -> some View{
        let shareButton: Button = Button(role: .none, action: {
            
        }, label: {
            Text("Share")
        })
        let reportButton: Button = Button(role: .destructive, action: {
            
        }, label: {
            Text("Report")
        })
        let deleteButton: Button = Button(role: .destructive, action: {
            
        }, label: {
            Text("Delete")
        })
        let cancelButton: Button = Button(role: .cancel, action: {
            
        }, label: {
            Text("Cancel")
        })
        
        switch actionSheetOption {
            case .isOtherPost:
                shareButton
                reportButton
                cancelButton
            case .isMyPost:
                shareButton
                reportButton
                deleteButton
                cancelButton
        }
    }
}

struct ActionsheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionsheetBootcamp()
    }
}
