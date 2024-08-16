//
//  AppDictApp.swift
//  AppDict
//
//  Created by Katia Krut on 28.07.2024.
//

import SwiftUI

@main
struct AppDictApp: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
