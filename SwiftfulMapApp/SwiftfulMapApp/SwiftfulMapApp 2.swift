//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Spencer Hurd on 1/25/22.
//

import SwiftUI

@main
struct SwiftfulMapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
