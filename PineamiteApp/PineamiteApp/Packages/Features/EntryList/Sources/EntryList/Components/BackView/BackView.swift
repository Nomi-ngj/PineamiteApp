//
//  BackView.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//

import SwiftUI
import DesignSystem

public struct BackView: View {
    private let theme = Theme()
    private let onBack: () -> Void
    
    public init(onBack: @escaping () -> Void) {
        self.onBack = onBack
    }
    
    public var body: some View {
        HStack {
            Button(action: {
                onBack()
            }) {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .font(theme.fonts.caption1Med)
                    Text("Back to Rally")
                        .lineLimit(1)
                        .font(theme.fonts.subheadBold)
                }
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .background(Color.white.opacity(0.1))
                .clipShape(Capsule())
            }
            .frame(width: 130, alignment: .leading)
        }
    }
}

#Preview {
    BackView {
        
    }
}
