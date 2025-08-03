//
//  Gradient.swift
//  Theme
//
//  Created by Rohit Kumar on 03/08/2025.
//

import SwiftUI

public extension LinearGradient {
    static let blackToGray = LinearGradient(
        gradient: Gradient(colors: [.entryRowGradient, .black]),
        startPoint: .leading,
        endPoint: .trailing
    )
}
