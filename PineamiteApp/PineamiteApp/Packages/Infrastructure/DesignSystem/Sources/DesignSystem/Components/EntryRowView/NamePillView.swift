//
//  NamePillView.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 03/08/2025.
//


import SwiftUI
import Theme

public struct NamePillView: View {
    let name: String
    let nameColor: Color
    let backgroundColor: Color
    let initialColor: Color
    let theme: Theme
    let textColor: Color

    public var body: some View {
        let initials = name
            .split(separator: " ")
            .prefix(2)
            .compactMap { $0.first }
            .map(String.init)
            .joined()

        HStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(initialColor)
                    .frame(width: 26, height: 26)
                Text(initials)
                    .font(theme.fonts.caption1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(textColor)
                    .padding(.horizontal, 4)
            }

            Text(name)
                .font(theme.fonts.caption2Med)
                .foregroundColor(nameColor)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .layoutPriority(1)
                
        }
        .frame(height: 26)
        .padding(.trailing, 10)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}
