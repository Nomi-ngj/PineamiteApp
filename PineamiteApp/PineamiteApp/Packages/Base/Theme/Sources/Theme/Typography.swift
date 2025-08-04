//
//  Typography.swift
//  Theme
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//


import SwiftUI
/**
 The name of the font family used.
 */
fileprivate let familyName = "Gilroy"

/**
 A struct for managing fonts used in the application.
 */
public struct Typography {
    
    public init() {}
    
    /**
     Returns a UIFont object for a given font type and size.
     - Parameters:
     - type: The type of font.
     - size: The size of the font.
     - Returns: A UIFont object.
     */
    public func getFont(type: AppFont, size: CGFloat) -> Font {
        return type.swiftUIFont(size)
    }
    
    public func getFont(type: AppFont, size: FontSize) -> Font {
        return type.swiftUIFont(size.rawValue)
    }
    
    /// Returns a UIKit `UIFont`
    public func getUIFont(type: AppFont, size: CGFloat) -> UIFont {
        return type.uiFont(size)
    }
    
    public func getUIFont(type: AppFont, size: FontSize) -> UIFont {
        return type.uiFont(size.rawValue)
    }
    
    public enum FontSize: CGFloat {
        case xxs = 10
        case xs = 12
        case small = 14
        case regular = 16
        case medium = 18
        case large = 20
        case xl = 24
        case xxl = 28
        case xxxl = 32
        case xxxxl = 36
    }
    /// Large title font.
    public let largeTitle = AppFont.black.swiftUIFont(55)
    /// Title 1 font.
    public let title1 = AppFont.regular.swiftUIFont(30)
    /// Title 2 font.
    public let title2 = AppFont.regular.swiftUIFont(24)
    /// Title 3 font.
    public let title3 = AppFont.regular.swiftUIFont(22)
    /// Headline font.
    public let headline = AppFont.bold.swiftUIFont(19)
    /// Body font.
    public let body = AppFont.regular.swiftUIFont(19)
    /// Callout font.
    public let callout = AppFont.regular.swiftUIFont(18)
    /// Subhead font.
    public let subhead = AppFont.regular.swiftUIFont(17)
    public let subheadBold = AppFont.bold.swiftUIFont(17)
    public let subhead2 = AppFont.semiBold.swiftUIFont(16)
    /// Footnote font.
    public let footnote = AppFont.regular.swiftUIFont(15)
    /// Footnote medium font.
    public let footnoteMedium = AppFont.semiBold.swiftUIFont(15)
    public let footnoteBold = AppFont.bold.swiftUIFont(15)
    /// Caption 1 font.
    public let caption1 = AppFont.regular.swiftUIFont(14)
    public let caption1Med = AppFont.semiBold.swiftUIFont(14)
    public let caption1Bold = AppFont.bold.swiftUIFont(14)
    /// Caption 2 font.
    public let caption2 = AppFont.regular.swiftUIFont(13)
    public let caption2Med = AppFont.semiBold.swiftUIFont(13)
    public let caption2Bold = AppFont.bold.swiftUIFont(13)
    /// Caption 3 font.
    public let caption3 = AppFont.semiBold.swiftUIFont(12)
    public let caption3Reg = AppFont.regular.swiftUIFont(12)
    public let caption4 = AppFont.semiBold.swiftUIFont(10)
    public let caption5 = AppFont.semiBold.swiftUIFont(8)
    /// Text field font.
    public let textField = AppFont.regular.swiftUIFont(16)
    /// Bold title font.
    public let titleBold = AppFont.bold.swiftUIFont(34)
    /// Medium title 2 font.
    public let title2medium = AppFont.semiBold.swiftUIFont(24)
    /// Medium title 3 font.
    public let title3medium = AppFont.semiBold.swiftUIFont(22)
    /// Medium callout font.
    public let calloutMedium = AppFont.semiBold.swiftUIFont(18)
    /// Gallery widget title font.
    public let galleryWidgetTitle = AppFont.bold.swiftUIFont(20)
    /// Semibold subheadline font.
    public let subHeadlineSemibold = AppFont.bold.swiftUIFont(17)
    /// Medium subheadline font.
    public let subHeadlineMedium = AppFont.semiBold.swiftUIFont(17)
    
    /**
     Enumeration for different font types.
     */
    public enum AppFont: String {
        case regular = "Regular"
        case semiBold = "SemiBold"
        case bold = "Bold"
        case black = "Black"
        case blackItalic = "Medium"
        
        /**
         Returns a UIFont object for the given font type and size.
         - Parameters:
         - size: The size of the font.
         - Returns: A UIFont object.
         */
        public func swiftUIFont(_ size: CGFloat) -> Font {
            
            return Font.custom(fullFontName, size: size)
            
        }
        
        /// Returns a **UIKit `UIFont`**
        public func uiFont(_ size: CGFloat) -> UIFont {
            return UIFont(name: fullFontName, size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        /**
         The full name of the font, including family and type.
         */
        fileprivate var fullFontName: String {
            return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
        }
    }
}
