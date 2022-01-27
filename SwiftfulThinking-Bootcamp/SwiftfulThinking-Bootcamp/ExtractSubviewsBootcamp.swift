//
//  ExtractSubviewsBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/27/22.
//

import SwiftUI

struct ExtractSubviewsBootcamp: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "Bananas", count: 34, color: .yellow)
        }
    }
}

struct ExtractSubviewsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubviewsBootcamp()
    }
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
