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
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured
                
                Color.clear.frame(height: 1000)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Featured", hasScroll: $hasScrolled)
            )
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPrefenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPrefenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                hasScrolled = value < 0 ? true : false
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(courses) { item in
                FeaturedItem(course: item)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(height: 430)
        .background(
            Image("Blob 1").offset(x: 250, y: -100)
        )
    }
}

#Preview {
    HomeView()
}
