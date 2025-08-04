//
//  Constants.swift
//  Theme
//
//  Created by Nouman Gul Junejoon 04/08/2025.
//

import Foundation
import SwiftUI

@MainActor
public struct Constants {
    
    public init() {}
    
    public static var isIPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    public static var isIPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    public static let screenHeight: CGFloat = UIScreen.main.bounds.height
    public static let screenWidth: CGFloat = UIScreen.main.bounds.height

    public static var minHeight: CGFloat {
        UIScreen.main.bounds.height * 0.20 // 20% of screen height
    }
    public static var maxHeight: CGFloat {
        UIScreen.main.bounds.height - 140 // -140 of screen height
    }
}

