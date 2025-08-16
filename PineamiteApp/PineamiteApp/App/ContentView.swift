//
//  ContentView.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import SwiftUI
import DesignSystem
import EntryList

struct ContentView: View {
    
    // Current Selected CustomBottomTabBar Item, Defaul is Home/Dashboard
    @State private var currentTab: TabItem = .home
    
    // Handling Menu Open/Close functionality
    @State private var isMenuOpen = false
    
    // Side Menu Selection Default "Profile", can change to any default here.
    @State var selectedSideMenu: SideMenuItem = .profile
    
    var body: some View {
        
        // Slide SideMenu Start
        SideMenuContainerView(selectedSideMenu: $selectedSideMenu, isMenuOpen: $isMenuOpen) {
            ZStack {
                // Event List Start
                if currentTab == .race {
                    EntryList()
                }
                // Event List End
                
                // HeaderView Start
                VStack {
                    HeaderView(selectedTab: $currentTab, points: 2500, onMenuTapped: {
                        isMenuOpen = true
                    })
                    .ignoresSafeArea()
                    Spacer()
                }
                // HeaderView End
                
                // Custom TabBar End
                CustomBottomTabBar(selectedTab: $currentTab)
                    .ignoresSafeArea()
                // Custom TabBar End
            }
        }
        .ignoresSafeArea()
        .onChange(of: selectedSideMenu) { newValue in
            debugPrint(newValue)
            if newValue == .profile {
                currentTab = .profile
            }else if newValue == .tracks {
                currentTab = .race
            }else{
                currentTab = .home
            }
        }
        // Slide SideMenu End
    }
}

#Preview {
    ContentView()
}
