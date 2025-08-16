//
//  PineamiteAppApp.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import SwiftUI
import DesignSystem
import Splash

@main
struct PineamiteAppApp: App {
    
    @State private var animate = false
    var body: some Scene {
        WindowGroup {
            if animate {
                ContentView()
            }else {
                SplashView(onFinish: {
                    animate = true
                })
                .onAppear {
                    DesignSystem.registerFontsIfNeeded()
                }
            }
            
        }
    }
}
