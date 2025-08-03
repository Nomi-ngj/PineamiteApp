//
//  ContentView.swift
//  PineamiteApp
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI
import DesignSystem
import EntryList
import Domain
import Theme

struct ContentView: View {
    @State private var currentTab: TabItem = .home
    private let theme = Theme()
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Spacer()
            
            EntryRowView(entry: RallyEntry.mockEntries.first!)
            Spacer()
            EntryRowView(entry: RallyEntry.mockEntries[2])
            CustomBottomTabBar(selectedTab: $currentTab)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
