//
//  Gradient.swift
//  Theme
//
//  Created by Nouman Gul Junejoon 03/08/2025.
//

import SwiftUI

public extension LinearGradient {
    static let blackToGray = LinearGradient(
        gradient: Gradient(colors: [.entryRowGradient, .black]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    static let grayToBlack = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 70/255, green: 40/255, blue: 110/255),
            .black
        ]),
        startPoint: .top,
        endPoint: .bottom
    )
        
}
