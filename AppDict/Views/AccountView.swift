//
//  AccountView.swift
//  AppDict
//
//  Created by Katia Krut on 06.08.2024.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.accent, .accent.opacity(0.7))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
            Text("Testing Acc")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.semibold))
            HStack {
                Image(systemName: "location").imageScale(.small)
                Text("location")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink { HomeView() } label: {
                Label("Settings", systemImage: "gear")
                
            }
            NavigationLink { HomeView() } label: {
                Label("Billing", systemImage: "creditcard")
            }
            NavigationLink { HomeView() } label: {
                Label("Help", systemImage: "questionmark").accentColor(.primary)
            }
        }
        .foregroundColor(.primary)
        .listRowSeparatorTint(.primary)
        .listRowSeparator(.hidden)
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://github.com/K-Krut")!) {
                    HStack {
                        Label("Web", systemImage: "house")
                        Spacer()
                        Image(systemName: "link").foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    deleteButton
                    pinButton
                }
            }
            
            Link(destination: URL(string: "https://github.com/K-Krut")!) {
                HStack {
                    Label("Web", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                deleteButton
                pinButton
            }
            
        }
        .foregroundColor(.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
    }    
    
    var deleteButton: some View {
        Button(action: { isDeleted = true }, label: {
            Label("Button", systemImage: "trash")
        })
        .tint(.red)
    }
}

#Preview {
    AccountView()
}
