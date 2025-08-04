//
//  ContentView.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejoon 02/08/2025.
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
    
    let mockChampions = ["Championship 1","Championship 2","Championship 3","Championship 4","Championship 5"]
    let mockCarClass = ["Car Class 1","Car Class 2","Car Class 3","Car Class 4","Car Class 5"]
    
    let mockRallyEntry = RallyEntry.mockEntries
    
    @State private var resetSheetToMin = false
    @State private var isMenuOpen = false
    @State var selectedSideMenu: SideMenuItem = .profile
    @State var title:String = "Dashboard"
    
    
    var body: some View {
        SideMenuContainerView(selectedSideMenu: $selectedSideMenu, isMenuOpen: $isMenuOpen) {
            ZStack {
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
                                        options: mockChampions,
                                        overlayColor: .namePillSecondaryTint
                                    ) { selection in
                                        debugPrint(selection)
                                    }
                                }
                                .frame(maxWidth: .infinity) // Equal width
                                
                                VStack(alignment: .leading) {
                                    FilterDropdown(
                                        label: "Select Car Class",
                                        options: mockCarClass,
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
                
                VStack {
                    HeaderView(selectedTab: $currentTab, points: 2500, onMenuTapped: {
                        isMenuOpen = true
                    })
                    .ignoresSafeArea()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    CustomBottomTabBar(selectedTab: $currentTab)
                        .ignoresSafeArea()
                    
                }
                .ignoresSafeArea()
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
    }
}

#Preview {
    ContentView()
}
