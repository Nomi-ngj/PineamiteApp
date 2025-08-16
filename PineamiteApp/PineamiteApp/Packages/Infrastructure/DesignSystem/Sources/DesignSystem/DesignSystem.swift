// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit
import CoreText

public enum DesignSystem {
    public static func registerFontsIfNeeded() {
        
        let fontNames = ["Kuunari Black", "Kuunari Bold", "Kuunari Light", "Kuunari Medium", "Kuunari Regular"]

        fontNames.forEach { name in
            registerFont(named: name)
        }
    }

    private static func registerFont(named name: String) {

        guard let url = Bundle.module.url(forResource: name, withExtension: "otf"),
              let dataProvider = CGDataProvider(url: url as CFURL),
              let font = CGFont(dataProvider) else {
            print("❌ Failed to load font: \(name)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("❌ Failed to register font \(name): \(error?.takeUnretainedValue().localizedDescription ?? "Unknown error")")
        }
    }
}
