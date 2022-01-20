//
//  ListView.swift
//  TodoList
//
//  Created by Spencer Hurd on 1/20/22.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "This is the first title",
        "This is the second title",
        "Third"
    ]
    
    var body: some View {
        List {
            ListRowView(title: "This is the first title")
        }
        .navigationTitle("Todo List 📝")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}
