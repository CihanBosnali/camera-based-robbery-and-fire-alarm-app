//
//  MapView.swift
//  landmarks
//
//  Created by cihan on 20.11.2019.
//  Copyright © 2019 Cihan Bosnalı. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
   func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    
    

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 41.0380308, longitude: 29.2667563)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
