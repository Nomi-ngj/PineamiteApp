// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import MapKit
import UIKit
import Domain

public struct RallyMapView: UIViewRepresentable {
    
    public let event:RaceEventLocation
    
    public init(event: RaceEventLocation) {
        self.event = event
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true

        // Add rally pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = event.coordinate
        annotation.title = event.title
        mapView.addAnnotation(annotation)

        // Center map around rally
        let region = MKCoordinateRegion(
            center: event.coordinate,
            latitudinalMeters: 150_000,
            longitudinalMeters: 150_000
        )
        mapView.setRegion(region, animated: false)

        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
        // No dynamic updates yet
    }

    public class Coordinator: NSObject, MKMapViewDelegate {
        public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation { return nil }

            let identifier = "RallyPin"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.markerTintColor = UIColor.systemIndigo

                // Optional: custom label inside callout
                let label = UILabel()
                label.text = annotation.title ?? ""
                label.font = UIFont.boldSystemFont(ofSize: 12)
                label.textColor = .white
                label.backgroundColor = .systemBlue
                label.layer.cornerRadius = 8
                label.layer.masksToBounds = true
                label.textAlignment = .center
                label.numberOfLines = 1
                label.frame = CGRect(x: 0, y: 0, width: 160, height: 30)

                annotationView?.detailCalloutAccessoryView = label
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }
    }
}
