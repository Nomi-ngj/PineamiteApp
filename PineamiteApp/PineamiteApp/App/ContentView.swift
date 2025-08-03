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
import RallyMap

struct ContentView: View {
    @State private var currentTab: TabItem = .home
    private let theme = Theme()
    let event = RaceEventLocation.mockEventLocation
    var body: some View {
        
        ZStack {
            RallyMapView(event: event)
                .edgesIgnoringSafeArea(.all)
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
}

#Preview {
    ContentView()
}
