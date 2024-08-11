//
//  HomeView.swift
//  AppDict
//
//  Created by Katia Krut on 08.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                Color.clear.preference(key: ScrollPrefenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
            }
            .frame(height: 0)
            
            FeaturedItem()
            
            Color.clear.frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollPrefenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasScrolled = value < 0 ? true : false
            }
        })
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
    }
}

#Preview {
    HomeView()
}
