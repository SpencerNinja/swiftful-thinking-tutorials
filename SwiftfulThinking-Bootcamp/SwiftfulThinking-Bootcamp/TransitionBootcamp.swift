//
//  TransitionBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 1/31/22.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    // 50% of the screen height
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(.slide)
//                    .transition(.move(edge: .bottom))
//                    .transition(AnyTransition.opacity.animation(.easeInOut))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: AnyTransition.opacity.animation(.easeInOut)
                    ))
                    .animation(.easeInOut)
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
