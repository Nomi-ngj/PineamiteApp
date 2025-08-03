//
//  EntryRowView.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 02/08/2025.
//

import SwiftUI
import Domain
import Theme

import SwiftUI

public struct EntryRowView: View {
    let entry: RallyEntry
    private let theme = Theme()

    public init(entry: RallyEntry) {
        self.entry = entry
    }

    public var body: some View {
        ZStack {
            backgroundView
            contentView
        }
        .frame(maxWidth: .infinity)
        .frame(height: entry.entryNumber == nil ? 65 : 110)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
    }
}

// MARK: - Components
private extension EntryRowView {
    
    /// Background style depending on whether entry is TBD or confirmed
    var backgroundView: some View {
        Group {
            if entry.entryNumber == nil {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.clear)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(
                                Color.namePillSecondaryTint.opacity(0.3),
                                style: StrokeStyle(lineWidth: 1, dash: [6])
                            )
                    )
                    .shadow(color: Color.black.opacity(0.15), radius: 4)
                    .frame(height: 60)
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient.blackToGray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 85/255, green: 50/255, blue: 140/255), lineWidth: 1)
                    )
            }
        }
    }
    
    /// Main content layout
    var contentView: some View {
        HStack {
            entryInfoView
            Spacer()
            entryNumberView
        }
        .padding()
    }
    
    /// Left side: driver/co-driver + car/team
    var entryInfoView: some View {
        VStack(alignment: .leading, spacing: 12) {
            driverCoDriverPills
            carAndTeamView
        }
    }
    
    /// Driver & Co-driver pills
    var driverCoDriverPills: some View {
        HStack(spacing: 8) {
            if let driver = entry.driver {
                NamePillView(
                    name: driver,
                    nameColor: .namePillText,
                    backgroundColor: .namePillPrimaryTint.opacity(0.20),
                    initialColor: .namePillPrimaryTint,
                    theme: theme,
                    textColor: .black
                )
            }
            if let coDriver = entry.coDriver {
                NamePillView(
                    name: coDriver,
                    nameColor: .white,
                    backgroundColor: .namePillSecondaryTint.opacity(0.20),
                    initialColor: .namePillSecondaryTint,
                    theme: theme,
                    textColor: .white
                )
            }
        }
    }
    
    /// Car & Team or placeholder text
    var carAndTeamView: some View {
        Group {
            if entry.entryNumber == nil {
                Text("Entry Details To Be Decided")
                    .font(theme.fonts.subheadBold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                    .foregroundColor(.teamNameText)
            } else {
                if let car = entry.car {
                    Text(car)
                        .font(theme.fonts.caption1Med)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                if let team = entry.team {
                    Text(team)
                        .font(theme.fonts.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.teamNameText)
                }
            }
        }
    }
    
    /// Right side: entry number or TBD label
    var entryNumberView: some View {
        Group {
            if let number = entry.entryNumber {
                Text("#\(number)")
                    .font(theme.fonts.largeTitle)
                    .foregroundColor(.nameRowTertiary)
                    .padding(.bottom, -20)
                    .frame(maxHeight: .infinity, alignment: .bottom)
            } else {
                Text("TBD")
                    .font(theme.fonts.largeTitle)
                    .foregroundColor(.nameRowTertiary.opacity(0.3))
            }
        }
    }
}
