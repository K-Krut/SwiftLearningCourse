//
//  Animations.swift
//  AppDict
//
//  Created by Katia Krut on 15.08.2024.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.6, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
