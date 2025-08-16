// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI

public class Theme: ObservableObject {
    public init() {}

    @Published public var fonts: Typography = Typography()
}
