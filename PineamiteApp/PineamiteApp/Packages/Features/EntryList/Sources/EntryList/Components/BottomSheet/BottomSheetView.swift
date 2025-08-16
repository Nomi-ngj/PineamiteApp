//
//  BottomSheetView.swift
//  DesignSystem
//
//  Created by Nouman Gul Junejo on 03/08/2025.
//

import SwiftUI
import DesignSystem

public struct BottomSheetView<Content: View>: View {
    @State var maxHeight: CGFloat = Constants.maxHeight
    @State var minHeight: CGFloat = Constants.minHeight
    
    @Binding var resetToMin: Bool // external trigger
    @State private var currentHeight: CGFloat
    @GestureState private var dragOffset: CGFloat = 0
    
    let content: Content

    @State private var isLandscape = UIDevice.current.orientation.isLandscape
    @Environment(\.layoutDirection) var layoutDirection
    
    public init(resetToMin: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
//        self.minHeight = minHeight
//        self.maxHeight = maxHeight
        self._resetToMin = resetToMin
        self._currentHeight = State(initialValue: Constants.minHeight)
        self.content = content()
    }

    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Drag indicator
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 6)
                    .padding(.top, 8)
                    .padding(.bottom, 4)

                content
                    .frame(maxHeight: .infinity)
            }
            .frame(width: geometry.size.width, height: currentHeight + dragOffset)
            .background(
                LinearGradient.grayToBlack
                .clipShape(RoundedRectangle(cornerRadius: 20))
            )
            .cornerRadius(20)
            .shadow(radius: 5)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        let newHeight = currentHeight - value.translation.height
                        state = min(max(newHeight, minHeight), maxHeight) - currentHeight
                    }
                    .onEnded { value in
                        let newHeight = currentHeight - value.translation.height
                        currentHeight = min(max(newHeight, minHeight), maxHeight)
                    }
            )
            .onChange(of: resetToMin) { newValue in
                if newValue {
                    self.maxHeight = Constants.maxHeight
                    self.minHeight = Constants.minHeight
                    withAnimation(.spring()) {
                        currentHeight = minHeight
                    }
                    resetToMin = false // reset trigger
                }
            }
            .animation(.interactiveSpring(), value: dragOffset)
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                
                Task {
                    await MainActor.run {
                        if Constants.isIPad {
                            self.isLandscape = UIDevice.current.orientation.isLandscape
                            self.resetToMin = true
                        }
                    }
                }
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


