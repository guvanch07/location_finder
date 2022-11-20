//
//  Home.swift
//  location_finder
//
//  Created by Macbook on 13.11.22.
//

import SwiftUI
import CoreLocation

struct Home: View {
    @StateObject var mapData = MapViewModel()
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        ZStack{
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all,edges: .all)
            
            VStack{
                VStack(spacing: 0){
                    HStack{
                        Image(systemName: "magnifyingglass")
                        TextField("Search",text: $mapData.searchTxt)
                            .colorScheme(.light)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background()
                    
                    
                    // Dispaling result
                    
                    if !mapData.places.isEmpty && mapData.searchTxt != ""{
                        ScrollView{
                            VStack(spacing:15){
                                ForEach(mapData.places){place in
                                    Text(place.placemark.name ?? "")
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity,  alignment: .leading)
                                        .padding(.leading)
                                        .onTapGesture {
                                            mapData.selectPlcae(place: place)
                                        }
                                    Divider()
                                    
                                }
                            }
                            padding(.top)
                        }
                        .background(Color.white)
                    }
                    
                    
                }
                
                .padding()
                
                Spacer()
                VStack{
                    Button(action: mapData.focusLocation,label: {
                        Image(systemName: "location.fill"
                        )
                        .font(.title2)
                        .padding(10)
                        .background()
                        .clipShape(Circle())
                    })
                    Button(action: mapData.upateMapType,label: {
                        Image(systemName: mapData.mapType == .standard ? "network" : "map"
                        )
                        .font(.title2)
                        .padding(10)
                        .background()
                        .clipShape(Circle())
                    })
                }
                .frame(maxWidth: .infinity,  alignment: .trailing)
                .padding()
            }
        }
        .onAppear(perform: {
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        .alert(isPresented: $mapData.permissionDenided,
               content: {
            Alert(title: Text("Permission Denided"),
                  message: Text("Please Enable Permission In App Settings"),
                  dismissButton: .default(Text("Goto Settings"),
                                          action: {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
            
        })
        .onChange(of: mapData.searchTxt, perform: { newValue in
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay){
                if newValue == mapData.searchTxt{
                    self.mapData.searchQuery()
                }
            }
        })
    }
}


