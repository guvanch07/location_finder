//
//  Home.swift
//  location_finder
//
//  Created by Macbook on 13.11.22.
//

import SwiftUI

struct Home: View {
    @StateObject var mapData = MapViewModel()
    var body: some View {
        ZStack{
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all,edges: .all)
        }
    }
}


