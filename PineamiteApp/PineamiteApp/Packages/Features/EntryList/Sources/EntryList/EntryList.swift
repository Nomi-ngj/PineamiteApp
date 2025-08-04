// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Domain
import DesignSystem

public struct EntryList: View {
    let mockRallyEntry: [RallyEntry]
    
    public init(rallyEntry: [RallyEntry]) {
        self.mockRallyEntry = rallyEntry
    }
//    public init() {}
    
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: 6) {
                ForEach(mockRallyEntry) { entry in
                    EntryRowView(entry: entry)
                }
            }
            Spacer(minLength: 90)
        }
    }
}
