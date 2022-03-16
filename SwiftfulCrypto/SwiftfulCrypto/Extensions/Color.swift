//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Spencer Hurd on 3/2/22.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
//    static let theme = ColorTheme2()
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    
}

struct ColorTheme2 {
    
    let accent = Color.blue.opacity(0.5)
    let background = Color.blue
    let green = Color.green
    let red = Color.red
    let secondaryText = Color.gray
    
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
