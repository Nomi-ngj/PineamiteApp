//
//  RallyIconView.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//

import SwiftUI

public struct RallyIconView: View {
    
    public init() { }
    public var body: some View {
        Image(.rallyIcon)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 40)
            .frame(width: 130, alignment: .trailing) // 👈 Same width as left
    }
}
