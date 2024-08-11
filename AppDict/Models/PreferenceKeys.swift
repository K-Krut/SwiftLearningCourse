//
//  PreferenceKeys.swift
//  AppDict
//
//  Created by Katia Krut on 11.08.2024.
//

import SwiftUI

struct ScrollPrefenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
