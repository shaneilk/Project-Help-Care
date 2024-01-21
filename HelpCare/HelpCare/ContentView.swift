//
//  ContentView.swift
//  HelpCare
//
//  Created by Joseph Nevado on 2024-01-20.
//

import SwiftUI
import MapKit

enum mapDefaults{
    static let defaultLocation = CLLocationCoordinate2D(latitude: 49.261374, longitude: -123.246940)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    // zoom in 0.005
}

struct ContentView: View {
    @State private var defaultRegion = MKCoordinateRegion(center: mapDefaults.defaultLocation, span: mapDefaults.defaultSpan)
    
    @State var selectedHospital: Hospital?
    
    var sampleData = [Hospital(name: "Surrey Memorial Hospital", address: "13750 96 Ave, Surrey, BC V3V 1Z2", status: true, latitude: 49.176390, longitude: -122.842517),
                      Hospital(name: "Vancouver General Hospital", address: "Jim Pattison Pavilion, 899 W 12th Ave, Vancouver, BC V5Z 1M9", status: false, latitude: 49.261400, longitude: -123.124731),
                      Hospital(name: "St. Paul's Hospital", address: "1081 Burrard St, Vancouver, BC V6Z 1Y6", status: false, latitude: 49.280632, longitude: -123.130583),
                      Hospital(name: "Peace Arch Hospital", address: "15521 Russell Ave, White Rock, BC V4B 5M2", status: true, latitude: 49.030095, longitude: -122.794846),
                      Hospital(name: "Richmond Hospital", address: "7000 Westminster Hwy, Richmond, BC V6X 1A2", status: true, latitude: 49.168837, longitude: -123.149403),
                      Hospital(name: "Langley Memorial Hospital", address: "22051 Fraser Hwy, Langley Twp, BC V3A 4H4", status: false, latitude: 49.095417, longitude: -122.615070)]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $defaultRegion,
                annotationItems: sampleData,
                annotationContent: { hospital in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: hospital.latitude, longitude: hospital.longitude))
            })
                .ignoresSafeArea()
                .onChange(of: selectedHospital) { newHospital in
                    withAnimation {
                        defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: newHospital?.latitude ?? mapDefaults.defaultLocation.latitude, longitude: newHospital?.longitude ?? mapDefaults.defaultLocation.longitude), span: mapDefaults.defaultSpan)
                    }
                }
            VStack {
                Spacer()
                PersistentSheet(sampleData: sampleData, selectedHospital: $selectedHospital)
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
