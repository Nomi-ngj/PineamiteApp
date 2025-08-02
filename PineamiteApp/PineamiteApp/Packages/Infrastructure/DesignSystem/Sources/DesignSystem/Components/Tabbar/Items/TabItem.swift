//
//  TabItem.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI

public enum TabItem: Int, CaseIterable {
    case home, race, center, trophy, profile

    var icon: Image {
        switch self {
        case .home: return Image(.dashboardHome)
        case .race: return Image(.racesIcon)
        case .center: return Image(.circleCameraIcon)
        case .trophy: return Image(.rewardsIcon)
        case .profile: return Image(.profileIcon)
        }
    }
}
