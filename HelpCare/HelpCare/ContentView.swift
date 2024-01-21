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
}

struct ContentView: View {
    @State private var defaultRegion = MKCoordinateRegion(center: mapDefaults.defaultLocation, span: mapDefaults.defaultSpan)
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $defaultRegion)
                .ignoresSafeArea()
            VStack {
                Spacer()
                PersistentSheet()
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
