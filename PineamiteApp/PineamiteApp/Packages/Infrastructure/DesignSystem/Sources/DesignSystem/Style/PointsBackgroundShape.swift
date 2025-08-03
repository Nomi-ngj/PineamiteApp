//
//  PointsBackgroundShape.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 03/08/2025.
//

import SwiftUI

struct PointsBackgroundShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Top-left slightly inset
        path.move(to: CGPoint(x: rect.minX + 10, y: rect.minY))
        // Top-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        // Bottom-right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        // Bottom-left extended
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}
