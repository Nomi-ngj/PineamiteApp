//
//  RaceEventLocation.swift
//  Domain
//
//  Created by Rohit Kumar on 03/08/2025.
//

import Foundation
import CoreLocation

/// Represents a rally or race event's location details.
public struct RaceEventLocation: Identifiable {
    public let id = UUID()
    
    /// Official event title, e.g., "R Kings Down Rally 2025"
    public let title: String
    
    /// The geographical coordinates of the event location.
    public let coordinate: CLLocationCoordinate2D
    
    /// Optional description or notes about the event location.
    public let description: String?
    
    /// Optional date of the event.
    public let eventDate: Date?
    
    public init(title: String,
                coordinate: CLLocationCoordinate2D,
                description: String? = nil,
                eventDate: Date? = nil) {
        self.title = title
        self.coordinate = coordinate
        self.description = description
        self.eventDate = eventDate
    }
}

@MainActor
public extension RaceEventLocation {
    static let mockEventLocation = RaceEventLocation(
        title: "R Kings Down Rally 2025",
        coordinate: CLLocationCoordinate2D(latitude: 54.5973, longitude: -5.9301),
        description: "Annual rally championship track in Northern Ireland.",
        eventDate: Date(timeIntervalSince1970: 1735689600) // Example timestamp
    )

}
