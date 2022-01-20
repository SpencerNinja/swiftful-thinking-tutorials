//
//  PaddingAndSpacerBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/20/22.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Hello World")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
//                .multilineTextAlignment(.leading) // default
        }
//        .background(Color.blue)
        .padding()
        .padding(.vertical, 10)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0,
                    y: 10.0
                )
        )
        .padding(.horizontal, 10)
//        .background(Color.green)
        
//        Text("Hello World")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .frame(maxWidth: .infinity, alignment: .leading)
////            .background(Color.red)
//            .padding(.leading, 20)
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(Color.yellow)
////            .padding()  //.padding(.all, 10)
//            .padding(.all, 10)
//            .padding(.leading, 20)
//            .background(Color.blue)
        
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
