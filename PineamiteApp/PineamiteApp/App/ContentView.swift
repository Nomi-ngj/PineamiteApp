//
//  ContentView.swift
//  PineamiteApp
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var currentTab: TabItem = .home

    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            CustomBottomTabBar(selectedTab: $currentTab)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
