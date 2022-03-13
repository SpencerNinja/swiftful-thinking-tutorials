//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/10/22.
//

import SwiftUI

struct XMarkButton: View {
    
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            // standard method to dismiss sheets in SwiftUI
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

//struct XMarkButton_Previews: PreviewProvider {
//    static var previews: some View {
//        XMarkButton()
//    }
//}
