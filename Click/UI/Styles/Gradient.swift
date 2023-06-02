//
//  Gradient.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public extension Gradient {
    static let red = LinearGradient.red
}

public extension LinearGradient {
    static let red = LinearGradient(
        gradient: Gradient(colors: [.red, .orange]),
        startPoint: .leading,
        endPoint: .trailing)
}

public extension View {
    func gradientMask(_ gradient: LinearGradient) -> some View {
        self.overlay(gradient)
            .mask(self)
            .foregroundColor(.clear)
    }
}
