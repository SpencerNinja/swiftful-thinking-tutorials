//
//  LocationsViewModel.swift
//  SwiftfulMapApp
//
//  Created by Spencer Hurd on 1/25/22.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
