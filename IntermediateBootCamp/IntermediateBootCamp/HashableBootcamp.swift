//
//  HashableBootcamp.swift
//  IntermediateBootCamp
//
//  Created by Spencer Hurd on 2/16/22.
//

import SwiftUI

// Conforms to Identifiable
//struct MyCustomModel: Identifiable {
//    let id = UUID().uuidString
//    let title: String
//}

// Conforms to  Hashable
struct MyCustomModel: Hashable {
    let title: String
    let subtitle: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subtitle: "one"),
        MyCustomModel(title: "TWO", subtitle: "two"),
        MyCustomModel(title: "THREE", subtitle: "three"),
        MyCustomModel(title: "FOUR", subtitle: "four"),
        MyCustomModel(title: "FIVE", subtitle: "five")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
                // IF MyCustomModel conforms to Identifiable
//                ForEach(data) { item in
//                    Text(item.title)
//                        .font(.headline)
//                    Text(item.id)
//                        .font(.headline)
//                }
                
                // IF MyCustomModel conforms to Hashable
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                    Text(item.hashValue.description)
                        .font(.headline)
                }
                
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
