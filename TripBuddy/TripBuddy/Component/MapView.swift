//
//  MapView.swift
//  TripBuddy
//
//  Created by 김동경 on 9/25/24.
//

import SwiftUI
import MapKit




struct MapView: View {
    let title: String
    var coordinate: CLLocationCoordinate2D
    
    
    
    var body: some View {
        Map(position: .constant(.region(region))) {
            Marker(title, coordinate: coordinate)
        }
        .allowsHitTesting(false) //터치 이벤트 막아버림

    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
}

#Preview {
    MapView(title:"부산" ,coordinate: CLLocationCoordinate2D(latitude: 35.159328, longitude: 129.160384))
}

