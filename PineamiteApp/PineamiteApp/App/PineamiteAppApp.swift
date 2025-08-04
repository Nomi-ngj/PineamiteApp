//
//  PineamiteAppApp.swift
//  PineamiteApp
//
//  Created by Nouman Gul Junejo on 02/08/2025.
//

import SwiftUI
import Theme

@main
struct PineamiteAppApp: App {
    
    let appTheme: Theme = Theme()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appTheme)
        }
    }
}
