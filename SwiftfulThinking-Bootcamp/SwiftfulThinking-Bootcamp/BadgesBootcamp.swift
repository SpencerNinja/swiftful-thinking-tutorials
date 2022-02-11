//
//  BadgesBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/10/22.
//

import SwiftUI

/*
 Badges only work on
    - Lists
    - TabView
 */

struct BadgesBootcamp: View {
    var body: some View {
        
//        List {
//            Text("Hello World!")
//                .badge("NEW ITEMS")
//            Text("Hello World!")
//            Text("Hello World!")
//            Text("Hello World!")
//        }
        
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(2)

            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge(0)

            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Hello")
                }
                .badge("NEW")
        }
        
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
