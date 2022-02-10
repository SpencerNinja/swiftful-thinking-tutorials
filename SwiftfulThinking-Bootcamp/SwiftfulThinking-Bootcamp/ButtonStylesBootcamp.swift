//
//  ButtonStylesBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/10/22.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack {
            
            Button {
                
            } label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)

            
            Button("Button Title") {}
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .controlSize(.large)
            .buttonStyle(.plain)
            
            Button("Button Title") {}
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .controlSize(.regular)
            .buttonStyle(.bordered)
            
            Button("Button Title") {}
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .controlSize(.small)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {}
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .controlSize(.mini)
            .buttonStyle(.borderless)
            
        }
        .padding()
    }
}

struct ButtonStylesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesBootcamp()
    }
}
