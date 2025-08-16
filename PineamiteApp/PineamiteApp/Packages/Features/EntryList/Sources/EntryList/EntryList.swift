// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Domain
import RallyMap
import DesignSystem

public struct EntryList: View {
    
    // Adding Mock Event Location on Map
    let event = RaceEventLocation.mockEventLocation
    
    // Adding Mock Rally Entries
    let mockRallyEntry = RallyEntry.mockEntries
    
    // Handling on Back to minimize sheet again
    @State private var resetSheetToMin = false
    
    public init() {}
    
    public var body: some View {
        
        ZStack {
                RallyMapView(event: event)
                    .edgesIgnoringSafeArea(.all)
                BottomSheetView(resetToMin: $resetSheetToMin) {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .center) {
                            
                            BackView {
                                resetSheetToMin = true
                            }
                            TitleAndSubtitleView(entriesCount: mockRallyEntry.count)
                            RallyIconView()
                        }
                        .padding(.horizontal)
                        
                        HStack(alignment: .firstTextBaseline, spacing: 20) {
                            VStack(alignment: .leading) {
                                FilterDropdown(
                                    label: "Select Championship",
                                    options: Constants.mockChampions,
                                    overlayColor: .namePillSecondaryTint
                                ) { selection in
                                    debugPrint(selection)
                                }
                            }
                            .frame(maxWidth: .infinity) // Equal width
                            
                            VStack(alignment: .leading) {
                                FilterDropdown(
                                    label: "Select Car Class",
                                    options: Constants.mockCarClass,
                                    overlayColor: .blueTintTertiary
                                ) { selection in
                                    debugPrint(selection)
                                }
                            }
                            .frame(maxWidth: .infinity) // Equal width
                        }
                        .padding(.horizontal)

                        
                        ScrollView {
                            LazyVStack(spacing: 6) {
                                ForEach(mockRallyEntry) { entry in
                                    EntryRowView(entry: entry)
                                }
                            }
                            Spacer(minLength: 90)
                        }
                    }
                    .frame(alignment: .top)
                }
        }
        
        
        
    }
}
