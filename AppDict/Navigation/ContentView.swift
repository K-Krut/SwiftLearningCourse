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
            Group {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
