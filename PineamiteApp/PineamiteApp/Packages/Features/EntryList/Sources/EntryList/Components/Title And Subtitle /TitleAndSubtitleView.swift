//
//  TitleAndSubtitleView.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//

import SwiftUI
import DesignSystem

public struct TitleAndSubtitleView: View {
    
    private let theme = Theme()
    
    let entriesCount: Int
    
    public init(entriesCount: Int?) {
        self.entriesCount = entriesCount ?? 0
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text("Entry List")
                .font(theme.fonts.subheadBold)
                .foregroundColor(.white)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text("\(entriesCount) Entries")
                .font(theme.fonts.caption4)
                .foregroundColor(Color.appSecondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity) // Expands between left and right
    }
}
