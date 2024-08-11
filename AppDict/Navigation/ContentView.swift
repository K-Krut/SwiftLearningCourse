//
//  ContentView.swift
//  AppDict
//
//  Created by Katia Krut on 28.07.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack (alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .explore:
                AccountView()
            case .notifications:
                AccountView()
            case .library:
                AccountView()
            }
            
            TabBarView()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 70)
        }
    }
}

#Preview {
    ContentView()
}

