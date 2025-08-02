//
//  CustomBottomTabBar.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI

public struct CustomBottomTabBar: View {
    @Binding var selectedTab: TabItem

    public init(selectedTab: Binding<TabItem>) {
        self._selectedTab = selectedTab
    }
    
    public var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    TabBarShape()
                        .fill(Color.black.opacity(0.6))
                        .frame(height: 70)
                        .clipShape(TabBarShape())
                        .overlay(
                            TabBarShape()
                                .stroke(Color.gray.opacity(selectedTab == .race ? 0.2 : 0.8), lineWidth: selectedTab == .race ? 2:1)
                        )

                        
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: -2)

                    HStack {
                        ForEach(TabItem.allCases, id: \.self) { tab in
                            if tab == .center {
                                Spacer().frame(width: 65) // Space for floating button
                            } else {
                                TabBarItemView(tab: tab, isSelected: selectedTab == tab) {
                                    selectedTab = tab
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.bottom, 20)

                    FloatingCenterButton {
                        selectedTab = .center
                    }
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}
