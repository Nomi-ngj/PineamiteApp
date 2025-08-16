import SwiftUI

public struct SplashView: View {
    @State private var animate = false
    public var onFinish: () -> Void

    public init(onFinish: @escaping () -> Void) {
        self.onFinish = onFinish
    }

    public var body: some View {
        ZStack {
            Image(.applogo)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .scaleEffect(animate ? 2 : 1)
                .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: animate)
        }
        .foregroundStyle(.white)
        .ignoresSafeArea()
        .onAppear {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                onFinish()
            }
        }
    }
}

#Preview {
    SplashView(onFinish: {})
}
