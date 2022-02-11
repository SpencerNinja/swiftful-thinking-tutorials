//
//  ListSwipeActionsBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/10/22.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Save") {
                            
                        }
                        .tint(.blue)
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Share") {
                            
                        }
                        .tint(.yellow)
                    }
            }
//            .onDelete(perform: delete)
        }
    }
    
    func delete(indexSet: IndexSet) {
        
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}

//// THIS METHOD
//ForEach(fruits, id: \.self) {
//    Text($0.capitalized)
//}
//// IS THE SAME AS THIS
//ForEach(fruits, id: \.self) { fruit in
//    Text(fruit.capitalized)
//}
