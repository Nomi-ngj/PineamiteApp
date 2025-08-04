//
//  SideMenuItem.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejoon 02/08/2025.
//

import Foundation

public enum SideMenuItem: Hashable, CaseIterable {
    case profile
    case drivers
    case upcommingEvents
    case tracks
    case support
    case terms
    case privacy
    case logout
    
    public var title: String {
        switch self {
        case .profile: return "Profile"
        case .drivers: return "Drivers"
        case .upcommingEvents: return "Upcomming Events"
        case .tracks: return "Tracks"
        case .support: return "Support"
        case .terms: return "Terms & Conditions"
        case .privacy: return "Privacy Policy"
        case .logout: return "Logout"
        }
    }
}

