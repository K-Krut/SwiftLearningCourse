//
//  SearchView.swift
//  AppDict
//
//  Created by Katia Krut on 20.08.2024.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
                    Text(item.title)
                }
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done").bold()
            })
        }
    }
}

#Preview {
    SearchView()
}
