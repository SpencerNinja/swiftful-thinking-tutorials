//
//  DocumentationBootcamp.swift
//  SwiftfulThinking-Bootcamp
//
//  Created by Spencer Hurd on 2/3/22.
//

import SwiftUI

struct DocumentationBootcamp: View {
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello")
                ForEach(data, id: \.self) { name in
                    Text(name)
                        .font(.headline)
                }
            }
            .navigationTitle("Documentation")
            .navigationBarItems(trailing:
            Button("ALERT", action: {
                showAlert.toggle()
            })
            )
            .alert(isPresented: $showAlert, content: {
                getAlert(text: "This is the alert")
            })
        }
    }
    
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
    
}

struct DocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationBootcamp()
    }
}
