//
//  AccountView.swift
//  AppDict
//
//  Created by Katia Krut on 06.08.2024.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    
    var body: some View {
        NavigationView {
            
            List {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue, .blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(Image(systemName: "hexagon")
                            .symbolVariant(.fill)
                            .foregroundColor(.accent)
                            .font(.system(size: 200))
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
                
                 Section {
                     NavigationLink { ContentView() } label: {
                         Label("Settings", systemImage: "gear")
                             
                     }
                     NavigationLink { ContentView() } label: {
                         Label("Billing", systemImage: "creditcard")
                     }
                     NavigationLink { ContentView() } label: {
                         Label("Help", systemImage: "questionmark").accentColor(.primary)
                     }
                }
                 .foregroundColor(.primary)
                 .listRowSeparatorTint(.primary)
                 .listRowSeparator(.hidden)
                Section {
                    if !isDeleted {
                        Link(destination: URL(string: "https://github.com/K-Krut")!) {
                            HStack {
                                Label("Web", systemImage: "house")
                                Spacer()
                                Image(systemName: "link")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: { isDeleted = true }, label: {
                                Label("Button", systemImage: "trash")
                            })
                            .tint(.red)
                            Button {} label: {
                                Label("Pin", systemImage: "pin")
                            }
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
                    
                }.foregroundColor(.primary)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
        .preferredColorScheme(.dark)
}
