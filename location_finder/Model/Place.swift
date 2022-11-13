//
//  Place.swift
//  location_finder
//
//  Created by Macbook on 14.11.22.
//

import Foundation


import SwiftUI
import MapKit

struct Place: Identifiable {
    var id = UUID().uuidString
    var placemark: CLPlacemark
    
}
