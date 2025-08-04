//
//  ContentView.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import SwiftUI
import DesignSystem
import EntryList
import Domain
import Theme
import RallyMap

struct ContentView: View {
    
    // Current Selected CustomBottomTabBar Item, Defaul is Home/Dashboard
    @State private var currentTab: TabItem = .home
    
    // Adding Mock Event Location on Map
    let event = RaceEventLocation.mockEventLocation
    
    // Adding Mock Rally Entries
    let mockRallyEntry = RallyEntry.mockEntries
    
    // Handling on Back to minimize sheet again
    @State private var resetSheetToMin = false
    
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
                    RallyMapView(event: event)
                        .edgesIgnoringSafeArea(.all)
                    BottomSheetView(resetToMin: $resetSheetToMin) {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .center) {
                                
                                BackView {
                                    resetSheetToMin = true
                                }
                                TitleAndSubtitleView(entriesCount: mockRallyEntry.count)
                                RallyIconView()
                            }
                            .padding(.horizontal)
                            
                            HStack(alignment: .firstTextBaseline, spacing: 20) {
                                VStack(alignment: .leading) {
                                    FilterDropdown(
                                        label: "Select Championship",
                                        options: Constants.mockChampions,
                                        overlayColor: .namePillSecondaryTint
                                    ) { selection in
                                        debugPrint(selection)
                                    }
                                }
                                .frame(maxWidth: .infinity) // Equal width
                                
                                VStack(alignment: .leading) {
                                    FilterDropdown(
                                        label: "Select Car Class",
                                        options: Constants.mockCarClass,
                                        overlayColor: .blueTintTertiary
                                    ) { selection in
                                        debugPrint(selection)
                                    }
                                }
                                .frame(maxWidth: .infinity) // Equal width
                            }
                            .padding(.horizontal)
                            
                            
                            EntryList(rallyEntry: mockRallyEntry)
                        }
                        .frame(alignment: .top)
                    }
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
