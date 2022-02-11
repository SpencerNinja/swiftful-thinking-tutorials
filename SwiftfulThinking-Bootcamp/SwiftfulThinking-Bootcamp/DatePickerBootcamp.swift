//
//  DatePickerBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/3/22.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("SELECTED DATE IS:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
//            DatePicker("Select a date", selection: $selectedDate)
//            DatePicker("Select a date",
//                       selection: $selectedDate,
//                       displayedComponents: [
//                        .date, // display calendar picker
//                        .hourAndMinute // display time picker
//                       ]
//            )
                    DatePicker("Select a date",
                               selection: $selectedDate,
                               in: startingDate...endingDate
                    )
                        .accentColor(Color.red)
                        .datePickerStyle(
                            CompactDatePickerStyle() // default
            //                GraphicalDatePickerStyle()
            //                WheelDatePickerStyle()
                        )
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
