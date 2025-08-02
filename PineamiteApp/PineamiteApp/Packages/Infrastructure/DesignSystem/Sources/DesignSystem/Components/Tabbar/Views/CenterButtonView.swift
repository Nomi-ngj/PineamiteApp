//
//  CenterButtonView.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI

public struct FloatingCenterButton: View {
    let action: () -> Void

    public var body: some View {
        Button(action: action) {
                Image(.circleCameraIcon)
                    .resizable()
                    .frame(width: 60, height: 60)
        }
        .offset(y: -15)
    }
}
