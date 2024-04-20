//
//  LocationView.swift
//  iStore
//
//  Created by Mohamed Sayed on 11.04.24.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject var locationDataManager: LocationDataManager
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var position: MapCameraPosition = .automatic
    @State private var address: String
    @State private var postalCode: String
    @State private var city: String
    @State private var state: String
    @State private var latitude: Double
    @State private var longitude: Double
    
    @State private var isCurrentLocationTapped = false
    
    init(address: String, postalCode: String, city: String, state: String, latitude: Double, longitude: Double) {
        self.address = address
        self.postalCode = postalCode
        self.city = city
        self.state = state
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                Text("Delivery Address")
                    .font(.system(.subheadline, design: .rounded))
                    .opacity(0.5)
                
                Text(address + ", ")
                    .font(.system(.headline, design: .rounded))
                
                Text("\(postalCode) " + city + ", " + state)
                    .font(.system(.headline, design: .rounded))
                
                if !authenticationViewModel.isGuest {
                    Button("Use Home Address") {
                        withAnimation {
                            self.address = authenticationViewModel.user.address.address
                            self.postalCode = authenticationViewModel.user.address.postalCode
                            self.city = authenticationViewModel.user.address.city
                            self.state = authenticationViewModel.user.address.state
                            self.latitude = authenticationViewModel.user.address.coordinates.lat
                            self.longitude = authenticationViewModel.user.address.coordinates.lng
                            self.position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(.pink)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button("Use Current Location") {
                    withAnimation {
                        self.address = locationDataManager.address
                        self.postalCode = locationDataManager.postalCode
                        self.city = locationDataManager.city
                        self.state = locationDataManager.state
                        self.latitude = locationDataManager.latitude
                        self.longitude = locationDataManager.longitude
                        self.position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
                    }
                    
                    isCurrentLocationTapped = true
                }
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            Map(position: $position) {
                UserAnnotation()
                Marker("Delivery Address", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            }
        }
        .onAppear {
            if authenticationViewModel.isGuest {
                self.address = locationDataManager.address
                self.postalCode = locationDataManager.postalCode
                self.city = locationDataManager.city
                self.state = locationDataManager.state
                self.latitude = locationDataManager.latitude
                self.longitude = locationDataManager.longitude
                self.position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
            } else {
                self.position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
            }
        }
        .onDisappear {
            if isCurrentLocationTapped {
                locationDataManager.isCurrentLocation = true
            } else {
                locationDataManager.isCurrentLocation = false
            }
        }
    }
}
