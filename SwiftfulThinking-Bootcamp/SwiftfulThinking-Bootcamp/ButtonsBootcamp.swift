//
//  ButtonsBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/26/22.
//

import SwiftUI

struct ButtonsBootcamp: View {
    
    @State var title: String = "This is my title"
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text(title)
            
            Button("Press me") {
                self.title = "Button #1 was pressed"
            }
            .accentColor(.red)
            
            Button {
                self.title = "Button #2 was pressed"
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            
            Button(action: {
                self.title = "Button #3 was pressed"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
//                            .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            .foregroundColor(Color.red)
                    )
            })
            
            Button {
                self.title = "Button #4 was pressed" // action
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
            }


        } // end VStack
        
    }
}

struct ButtonsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBootcamp()
    }
}
