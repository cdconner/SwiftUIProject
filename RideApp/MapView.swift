//
//  MapView.swift
//  RideApp
//
//  Created by Christopher Conner on 6/19/20.
//  Copyright © 2020 Christopher Conner. All rights reserved.
//

import MapKit
import SwiftUI


struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    var mapAnnotations: [MKPointAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setCenter(CLLocationCoordinate2DMake(37.334728, -122.008715), animated: true)
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334728, longitude: -122.008715), latitudinalMeters: 100000, longitudinalMeters: 1000000), animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        if mapAnnotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(mapAnnotations)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var mapViewParent: MapView
        init (_ parent: MapView) {
            self.mapViewParent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            mapViewParent.centerCoordinate = mapView.centerCoordinate
        }
    }
}

extension MKPointAnnotation {
    static var appleParkExample: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Apple Park"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.334903, longitude: -122.008687)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(
            MKPointAnnotation.appleParkExample.coordinate),
            mapAnnotations: [MKPointAnnotation.appleParkExample])
    }
}
