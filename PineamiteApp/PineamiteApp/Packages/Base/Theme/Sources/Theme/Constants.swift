//
//  Constants.swift
//  Theme
//
//  Created by Nouman Gul Junejo on 04/08/2025.
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
    
    public static let mockChampions = ["Championship 1","Championship 2","Championship 3","Championship 4","Championship 5"]
    public static let mockCarClass = ["Car Class 1","Car Class 2","Car Class 3","Car Class 4","Car Class 5"]
}

