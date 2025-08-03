//
//  TabBarShape.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI

//TabBarShape
//A custom SwiftUI Shape used to create a tab bar background with a center bump for a floating action button and rounded top corners on both ends.
//
//Purpose
//This shape is ideal for creating a custom tab bar UI that:
//
//Has a U-shaped curve in the center (for a central floating button).
//
//Has smooth rounded corners on the left and right top edges.
//
//Fits full-width at the bottom of the screen.

public struct TabBarShape: Shape {
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height

        // Defines the bump width and height
        let curveWidth: CGFloat = 90
        let curveHeight: CGFloat = 20

        // Midpoint of the width (for center bump)
        let midX = width / 2

        // Start from bottom-left corner
        path.move(to: CGPoint(x: 0, y: height))

        // Move up left edge, add top-left corner curve
        path.addLine(to: CGPoint(x: 0, y: 40))
        path.addQuadCurve(to: CGPoint(x: 40, y: 0), control: CGPoint(x: 0, y: 0))

        // Draw straight line to before bump starts
        path.addLine(to: CGPoint(x: midX - curveWidth / 2 - 12, y: 0))

        // First half of bump (curve up)
        path.addCurve(
            to: CGPoint(x: midX, y: -curveHeight),
            control1: CGPoint(x: midX - 30, y: 0),
            control2: CGPoint(x: midX - 35, y: -curveHeight)
        )

        // Second half of bump (curve down)
        path.addCurve(
            to: CGPoint(x: midX + curveWidth / 2 + 12, y: 0),
            control1: CGPoint(x: midX + 35, y: -curveHeight),
            control2: CGPoint(x: midX + 30, y: 0)
        )

        // Straight line to before top-right corner
        path.addLine(to: CGPoint(x: width - 40, y: 0))

        // Top-right corner curve
        path.addQuadCurve(to: CGPoint(x: width, y: 40), control: CGPoint(x: width, y: 0))

        // Right edge down to bottom
        path.addLine(to: CGPoint(x: width, y: height))

        // Close path to complete shape
        path.closeSubpath()

        return path
    }
}
