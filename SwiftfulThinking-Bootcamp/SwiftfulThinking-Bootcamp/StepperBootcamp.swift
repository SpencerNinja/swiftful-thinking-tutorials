//
//  StepperBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/3/22.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
                .padding(50)
            Stepper("Stepper2:",
                    onIncrement: {
                incrementWidth(amount: 10)
            },
                    onDecrement: {
                incrementWidth(amount: -10)
            })
        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
