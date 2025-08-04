//
//  SideMenuView.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import SwiftUI
import Theme

public struct SideMenuView: View {
    @Binding var menuItems: [SideMenuItem]
    @Binding var isMenuOpen: Bool
    
    var onMenuTap: (SideMenuItem) -> Void
    private let theme: Theme = .init()
    
    let maxHeight: CGFloat = UIScreen.main.bounds.height
    let maxWidth: CGFloat = UIScreen.main.bounds.width
    
    public init(menuItems: Binding<[SideMenuItem]>, isMenuOpen: Binding<Bool>, onMenuTap: @escaping (SideMenuItem) -> Void) {
        self._menuItems = menuItems
        self._isMenuOpen = isMenuOpen
        self.onMenuTap = onMenuTap
    }
    public var body: some View {
        Group {
            if isMenuOpen {
                ZStack {
                    backgroundBlurView
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .center, spacing: 0) {
                            // Menu Items
                            ForEach(menuItems, id: \.self) { item in
                                menuItemRow(for: item)
                                Divider()
                                    .background(Color.white)
                                    .padding(.horizontal)
                            }
                            
                            Spacer()
                        }
                        .frame(width: Constants.isIPad ? 600 : 300)
                        .frame(maxHeight: .infinity)
                        .padding(.top, 60)
                        .background(
                            LinearGradient.grayToBlack
                        )
                        .ignoresSafeArea()
                        Spacer()
                    }
                }
            }
        }
    }
    
    private func menuItemRow(for item: SideMenuItem) -> some View {
        Button(action: {
            withAnimation(.easeInOut) {
                onMenuTap(item)
            }
        }) {
            HStack {
                Text(item.title)
                    .font(theme.fonts.caption1Bold)
                    .foregroundColor(.white)
                Spacer()
                Image(.arrowLeft)
                    .foregroundColor(.white)
                
            }
            .padding()
        }
    }
    
    private var backgroundBlurView: some View {
        Rectangle()
            .scaledToFill()
            .foregroundColor(.black.opacity(0.5))
            .ignoresSafeArea(edges: .top)
            .frame(width: maxWidth, height: maxHeight)
            .opacity(0.8)
            .onTapGesture {
                isMenuOpen = false
            }
    }
}
