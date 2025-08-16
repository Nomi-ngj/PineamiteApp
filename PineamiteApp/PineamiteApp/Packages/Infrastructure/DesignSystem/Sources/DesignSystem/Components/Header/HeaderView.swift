//
//  HeaderView.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//


import SwiftUI

// MARK: - Menu Button + Title
public struct MenuLeftView: View {
    @Binding var selectedTab: TabItem
    private let onMenuTapped: () -> Void
    private let theme: Theme = .init()

    public init(selectedTab: Binding<TabItem>, onMenuTapped: @escaping () -> Void) {
        self._selectedTab = selectedTab
        self.onMenuTapped = onMenuTapped
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 13) {
            Button(action: onMenuTapped) {
                Image(.hamburgerIcon)
                    .frame(alignment: .bottomLeading)
                    .padding(.bottom, -5)
            }
            Text(selectedTab.label)
                .font(theme.fonts.title2Bold)
                .foregroundColor(.white)
        }
    }
}

// MARK: - Points Section
public struct PointsView: View {
    private let points: Int
    private let theme: Theme = .init()
    
    public init(points: Int) {
        self.points = points
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 180, height: 50, alignment: .trailing)
                .overlay(alignment: .trailing) {
                    GeometryReader { geo in
                        PointsBackgroundShape()
                            .fill(Color.appHeader.opacity(0.4))
                            .ignoresSafeArea()
                            .frame(width: geo.size.width , height: geo.size.height)
                            .position(x: geo.size.width, y: 33)
                    }
                }
            
            HStack(alignment: .bottom, spacing: 16) {
                Image(.notificationIcon)
                    .foregroundColor(.white)
//                    .padding(.top, 5)
//                    .padding(.horizontal, 5)
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text("\(points)")
                        .foregroundColor(.white)
                        .font(theme.fonts.caption1Bold)
                        .padding(.top, 12)
//                        .padding(.trailing, -10)
                    Text("points earned")
                        .foregroundColor(.white)
                        .font(theme.fonts.caption4)
                        .padding(.bottom, 8)
//                        .padding(.trailing, -10)
                }
//                .padding(.top, 12)
                .frame(height: 40, alignment: .trailing)
            }
            .frame(width: 180, height: 50, alignment: .trailing)
            .background(
                GeometryReader { geo in
                    PointsBackgroundShape()
                        .fill(Color.appHeader)
                        .ignoresSafeArea()
//                        .frame(width: geo.size.width, height: geo.size.height)
                        .position(x: geo.size.width + 30, y: 33)
                }
            )
            .padding(.horizontal, 12)
        }
    }
}

// MARK: - Decorative Background
private struct HeaderBackground: View {
    var body: some View {
        ZStack {
            TopLeftWedge()
                .fill(Color.appHeader)
                .frame(width: 260, height: 116)
                .offset(x: -90, y: -10)
                .opacity(0.4)
                

            TopLeftWedge()
                .fill(Color.appHeader)
                .frame(width: 210, height: 116)
                .offset(x: -90, y: -10)
                
        }

    }
}

// MARK: - Header View
public struct HeaderView: View {
    @Binding var selectedTab: TabItem
    private let points: Int
    private let onMenuTapped: () -> Void

    public init(selectedTab: Binding<TabItem>, points: Int, onMenuTapped: @escaping () -> Void) {
        self._selectedTab = selectedTab
        self.points = points
        self.onMenuTapped = onMenuTapped
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            HeaderBackground()

            HStack(spacing: 12) {
                MenuLeftView(selectedTab: $selectedTab, onMenuTapped: onMenuTapped)
                Spacer()
                        
                PointsView(points: points)
//                    .opacity(selectedTab == .race ? 1:0.01)
            }
            .padding(.top, 50)
            .padding(.horizontal)
        }
        .frame(height: 120)
    }
}

#Preview {
    VStack {
        HeaderView(selectedTab: .constant(.race), points: 2400) {
            print("Menu tapped")
        }
        .ignoresSafeArea()
        Spacer()
    }
}
