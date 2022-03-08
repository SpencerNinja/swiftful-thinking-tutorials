//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/8/22.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
