//
//  AccountView.swift
//  AppDict
//
//  Created by Katia Krut on 06.08.2024.
//

import SwiftUI

struct AccountView: View {
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
                            .foregroundColor(.blue)
                            .font(.system(size: 200))
                            .offset(x: -50, y: -100)
                    )
                    Text("Testing kdf")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.weight(.semibold))
                    HStack {
                        Image(systemName: "location").imageScale(.large)
                        Text("TEST 2")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                 Section {
                     Label("Settings", systemImage: "gear")
                     Label("Billing", systemImage: "creditcard")
                     Label("Help", systemImage: "questionmark")
                         .imageScale(.small)
                }
                 .listRowSeparatorTint(.blue)
                 .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

#Preview {
    AccountView()
}
