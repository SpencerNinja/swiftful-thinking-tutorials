//
//  PickerBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/2/22.
//

import SwiftUI

struct PickerBootcamp: View {
    // Part of METHOD 1
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    // Part of METHOD 2
//    var numberList = ["1", "2", "3", "4"]
//    @State private var selectedNumber = "1"
    
    // Part of METHOD 3
//    enum NumberString: String, CaseIterable, Identifiable {
//        case one, two, three, four
//        var id: Self { self }
//    }
//    @State private var selectedNumber: NumberString = .one
    
    var body: some View {
        
        // METHOD 1
//        VStack {
//            HStack {
//                Text("Age:")
//                Text(selection)
//            }
//            Picker(
//                selection: $selection,
//                label: Text("Picker"),
//                content: {
//                    ForEach(18..<100) { number in
//                        Text("\(number)")
//                            .font(.headline)
//                            .foregroundColor(.green)
//                            .tag("\(number)")
//                    }
//                }
//            )
//            //.pickerStyle(.wheel) // same as WheelPickerStyle
//            .pickerStyle(WheelPickerStyle())
//            //.background(Color.gray.opacity(0.1))
//
//        }
        Picker(
            selection: .constant($selection),
            label:
                HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
            ,
            content: {
                ForEach(filterOptions, id: \.self) { option in
                    Text(option)
                        .tag(option)
                }
            }
        )
        .pickerStyle(MenuPickerStyle())
        
        
        // METHOD 2
//        Picker("Picker", selection: $selectedNumber) {
//            ForEach(numberList, id: \.self) {
//                Text($0)
//            }
//        }
//        .pickerStyle(.wheel)
        
        // METHOD 3
//        Picker("Picker", selection: $selectedNumber) {
//            Text("1").tag(NumberString.one)
//            Text("2").tag(NumberString.two)
//            Text("3").tag(NumberString.three)
//            Text("4").tag(NumberString.four)
//        }
//        .pickerStyle(.wheel)
        
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
