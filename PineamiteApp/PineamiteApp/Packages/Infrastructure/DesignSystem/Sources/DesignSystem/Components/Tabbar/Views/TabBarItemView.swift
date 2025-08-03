//
//  TabBarItemView.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI
import Theme

public struct TabBarItemView: View {
    let tab: TabItem
    let isSelected: Bool
    let action: () -> Void

    public var body: some View {
        Button(action: action) {
            tab.icon
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? Color.appSecondary : .gray)
        }
    }
}
