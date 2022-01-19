//
//  TextBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/19/22.
//

import SwiftUI

struct TextBootcamp: View {
    
    let oneline = "Hello, World!"
    let multiline = "Hello, World! This is the Swiftful Thinking Bootcamp. I am really enjoying this course and learning a lot."
    
    var body: some View {
        Text(oneline.capitalized)
//            .font(.body)
////            .fontWeight(.semibold)
//            .bold()
////            .underline()
//            .underline(true, color: Color.red)
//            .italic()
//            .strikethrough(true, color: Color.green)
//            .font(.system(size: 24, weight: .semibold, design: .serif))
//            .baselineOffset(10.0)
//            .kerning(10)
            .multilineTextAlignment(.leading)
            .foregroundColor(.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.1)
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
