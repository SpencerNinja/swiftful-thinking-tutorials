//
//  MultipleSheetsBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/15/22.
//

import SwiftUI

/*
 Three ways to get this to work:
     1. use a binding
     2. use multiple .sheets
     3. use $item
 */

// ------------------------------------------------------------------------------

// Method 1
//struct RandomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}
//
//struct MultipleSheetsBootcamp: View {
//
//    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
//    @State var showSheet: Bool = false
//
//    var body: some View {
//
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                selectedModel = RandomModel(title: "ONE")
//                showSheet.toggle()
//            }
//            Button("Button 2") {
//                selectedModel = RandomModel(title: "TWO")
//                showSheet.toggle()
//            }
//        }
//        .sheet(isPresented: $showSheet, content: {
//            NextScreen(selectedModel: $selectedModel)
//        })
//
//    }
//}
//
//struct NextScreen: View {
//
//    @Binding var selectedModel: RandomModel
//
//    var body: some View {
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}
//
//struct MultipleSheetsBootcamp_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSheetsBootcamp()
//    }
//}

// ------------------------------------------------------------------------------

// Method 2
//struct RandomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}
//
//struct MultipleSheetsBootcamp: View {
//
//    @State var selectedModel: RandomModel = RandomModel(title: "STARTING TITLE")
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
//
//    var body: some View {
//
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                showSheet.toggle()
//            }
//            .sheet(isPresented: $showSheet, content: {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            })
//            Button("Button 2") {
//                showSheet2.toggle()
//            }
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            })
//        }
//
//    }
//}
//
//struct NextScreen: View {
//
//    let selectedModel: RandomModel
//
//    var body: some View {
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}
//
//struct MultipleSheetsBootcamp_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSheetsBootcamp()
//    }
//}

// ------------------------------------------------------------------------------

// Method 3
struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}

