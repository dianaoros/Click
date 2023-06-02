//
//  Button+ProminentStyle.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public extension ButtonStyle where Self == ProminentButtonStyle<LinearGradient> {
    static var primary: ProminentButtonStyle<LinearGradient> {
        ProminentButtonStyle(gradient: .red)
    }
}

public extension ButtonStyle where Self == ProminentButtonStyle<Color> {
    static var secondary: ProminentButtonStyle<Color> {
        ProminentButtonStyle(color: .gray)
    }
}

public struct ProminentButtonStyle<Background: View>: ButtonStyle {
    @Environment(\.controlSize) var size
    @Environment(\.isEnabled) var isEnabled
    let background: Background
    
    public init(gradient: LinearGradient) where Background == LinearGradient {
        background = gradient
    }
    
    public init(color: Color) where Background == Color {
        background = color
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .callout()
            .foregroundColor(.white)
            .padding(.horizontal, 32)
            .frame(maxWidth: size.width, maxHeight: size.height)
            .background { actualBackground }
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.4 : 1)
    }
    
    @ViewBuilder
    private var actualBackground: some View {
        if isEnabled {
            background
        } else {
            Color.gray
        }
    }
}

extension ControlSize {
    var width: CGFloat? {
        switch self {
        case .mini, .small: return nil
        case .regular, .large: return .infinity
        @unknown default: return .infinity
        }
    }
    
    var height: CGFloat {
        switch self {
        case .mini: return 32
        default: return 44
        }
    }
}
