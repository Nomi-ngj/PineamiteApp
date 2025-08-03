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
            // 🟣 Initials Circle
            ZStack {
                Circle()
                    .fill(initialColor)
                    .frame(width: 26, height: 26)
                Text(initials)
                    .font(theme.fonts.caption1)
                    .foregroundColor(textColor)
            }

            // 👤 Full Name — No ellipsis
            Text(name)
                .font(theme.fonts.caption2Med)
                .foregroundColor(nameColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)  // shrink text instead of truncating
                .layoutPriority(1)        // give this more space than the circle
                
        }
        .frame(height: 26)
//        .frame(width: 120)
        .padding(.trailing, 10)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}
