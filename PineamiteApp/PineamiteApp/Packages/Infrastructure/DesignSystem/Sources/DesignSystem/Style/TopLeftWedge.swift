//
//  TopLeftWedge.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//

import SwiftUI

struct TopLeftWedge: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // Start at top-left
        path.move(to: CGPoint(x: 0, y: 0))
        // Top-right (slightly down)
        path.addLine(to: CGPoint(x: rect.width + 30, y: 0))
        // Bottom-right
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        // Bottom-left
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
