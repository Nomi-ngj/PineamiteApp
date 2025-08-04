//
//  MainContainerView.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejoon 02/08/2025.
//

import SwiftUI

public struct SideMenuContainerView<Content: View>: View {
    @Binding var isMenuOpen: Bool
    @Binding var selectedSideMenu: SideMenuItem
    let content: Content
    
    @State private var menuItems:[SideMenuItem] = SideMenuItem.allCases
    
    public init(selectedSideMenu: Binding<SideMenuItem>, isMenuOpen: Binding<Bool>, @ViewBuilder content: () -> Content ) {
        self._selectedSideMenu = selectedSideMenu
        self._isMenuOpen = isMenuOpen
        self.content = content()
    }

    public var body: some View {
        ZStack {
            VStack {
                content
                Spacer()
            }
            
            SideMenuView(menuItems: $menuItems, isMenuOpen: $isMenuOpen) { item in
                debugPrint("\(item.title) tapped")
                isMenuOpen = false
                self.selectedSideMenu = item
            }
        }
        .animation(.easeInOut(duration: 0.4), value: isMenuOpen)
    }
}
