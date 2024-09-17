//
//  SearchView.swift
//  AppDict
//
//  Created by Katia Krut on 20.08.2024.
//

import SwiftUI
struct SearchView: View {
    @State var text = ""
    let names = ["SwiftUI", "React", "UI Design"]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {

                    content
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1").offset(x: -100, y: -200)
                )
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "SwiftUI, React, UI Design") {
                ForEach(searchResults, id: \.self) { suggestion in
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Done").bold() })
        }
    }

    var content: some View {
        ForEach(courses.filter { $0.title.contains(text) || text == "" }) { item in
            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .background(Color("Background"))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.title).bold()
                    Text(item.text)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(.vertical, 4)
            .listRowSeparator(.hidden)
        }
    }

    var searchResults: [String] {
        if text.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(text) }
        }
    }
}

#Preview {
    SearchView()
}

