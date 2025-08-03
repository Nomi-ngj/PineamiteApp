//
//  BottomSheetView.swift
//  DesignSystem
//
//  Created by Rohit Kumar on 03/08/2025.
//

import SwiftUI

public struct BottomSheetView<Content: View>: View {
    let maxHeight: CGFloat
    let minHeight: CGFloat
    
    @Binding var resetToMin: Bool // external trigger
    @State private var currentHeight: CGFloat
    @GestureState private var dragOffset: CGFloat = 0
    
    let content: Content

    public init(
        minHeight: CGFloat,
        maxHeight: CGFloat,
        resetToMin: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self._resetToMin = resetToMin
        self._currentHeight = State(initialValue: minHeight)
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
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 70/255, green: 40/255, blue: 110/255),
                        .black
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
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
                    withAnimation(.spring()) {
                        currentHeight = minHeight
                    }
                    resetToMin = false // reset trigger
                }
            }
            .animation(.interactiveSpring(), value: dragOffset)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}


