//
//  MapViewModel.swift
//  location_finder
//
//  Created by Macbook on 13.11.22.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject,CLLocationManagerDelegate{
    @Published var mapView = MKMapView()
    
    // Region ..
    @Published var region: MKCoordinateRegion!
}
