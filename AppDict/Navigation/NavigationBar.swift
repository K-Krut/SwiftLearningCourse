//
//  NavigationBar.swift
//  AppDict
//
//  Created by Katia Krut on 08.08.2024.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @Binding var hasScroll: Bool
    @State var showSearch = false
    @State var showAccount = false
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScroll ? 1 : 0)
            
            Text(title)
                .animatableFont(size: hasScroll ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScroll ? -4 : 0)
            
            HStack(spacing: 16) {
                Button {
                    showSearch = true
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.body.weight(.bold))
                        .frame(width: 36, height: 36)
                        .foregroundColor(.secondary)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                }.sheet(isPresented: $showSearch) {
                    SearchView()
                }
                
                Button {
                    showAccount = true
                } label: {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                }.sheet(isPresented: $showAccount) {
                    AccountView()
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScroll ? -4 : 0)
        }
        .frame(height: hasScroll ? 40 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    NavigationBar(title: "Featured", hasScroll: .constant(false))
}
