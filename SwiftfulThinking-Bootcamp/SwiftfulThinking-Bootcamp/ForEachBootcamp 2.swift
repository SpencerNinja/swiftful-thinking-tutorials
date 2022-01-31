//
//  ForEachBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/26/22.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["Hi", "Hello", "Hey everyone", "Cowabunga"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            Spacer()
            
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
             
            Spacer()
            
            ForEach(0..<10) { index in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("Index is: \(index)")
                }
            }
            
            Spacer()
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
