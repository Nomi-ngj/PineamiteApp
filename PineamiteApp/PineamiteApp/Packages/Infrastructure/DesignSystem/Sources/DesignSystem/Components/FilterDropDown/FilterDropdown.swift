//
//  FilterDropdown.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejoon 03/08/2025.
//

import SwiftUI
import Theme

public struct FilterDropdown: View {
    var label: String
    var options: [String]
    var textColor: Color = .white
    var iconColor: Color = .white
    var overlayColor: Color
    
    @State private var selectedOption: String
    var onSelection: (String) -> Void
    
    private let theme = Theme()
    
    public init(label: String,
         options: [String],
         textColor: Color = .white,
         iconColor: Color = .white,
         overlayColor: Color,
         onSelection: @escaping (String) -> Void) {
        self.label = label
        self.options = options
        self.textColor = textColor
        self.iconColor = iconColor
        self.onSelection = onSelection
        self.overlayColor = overlayColor
        _selectedOption = State(initialValue: label)
    }
    
    public var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {
                    selectedOption = option
                    onSelection(option)
                }
                .font(theme.fonts.caption2Med)
            }
        } label: {
            HStack(spacing: 6) {
                Text(selectedOption)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(textColor)
                    .font(theme.fonts.caption2Med)
                Image(systemName: "chevron.down")
                    .foregroundColor(iconColor)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 12)
            .background(Color.gray.opacity(0.15))
            
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(overlayColor, lineWidth: 1.5)
            )
            .cornerRadius(24)
//            .frame(maxWidth: .infinity, alignment: .leading) // takes available width
        }
    }
}
