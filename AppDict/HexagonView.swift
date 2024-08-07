//
//  HexagonView.swift
//  AppDict
//
//  Created by Katia Krut on 07.08.2024.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(Image(systemName: "hexagon.fill"),in: CGRect(x: 0, y: 0, width: 200, height: 212)
            )
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue.opacity(0.9)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    HexagonView()
}
