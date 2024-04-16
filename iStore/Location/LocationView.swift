//
//  LocationView.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.04.24.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct LocationView: View {
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(initialPosition: position)
            
            LocationButton(.currentLocation) {
                print("got location")
            }
            .foregroundColor(.white)
            .tint(.pink)
            .clipShape(.rect(cornerRadius: 10))
            .labelStyle(.iconOnly)
            .symbolVariant(.fill)
            .padding()
        }
    }
}

#Preview {
    LocationView()
}
