//
//  Font+Didot.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public extension Font {
    static func didot(_ style: Font.TextStyle, size: CGFloat? = nil) -> Font {
        .custom(style.didotFontName(), size: size ?? style.standardSize(), relativeTo: style)
    }
    
    static func didot(weight: DidotWeight = .regular, size: CGFloat) -> Font {
        .custom(weight.fontName, size: size)
    }
}

public extension UIFont {
    static func didot(style: Font.TextStyle, size: CGFloat? = nil) -> UIFont {
        UIFont(name: style.didotFontName(), size: size ?? style.standardSize())!
    }
    
    static func didot(weight: Font.DidotWeight, size: CGFloat) -> UIFont {
        UIFont(name: weight.fontName, size: size)!
    }
}

public extension Font {
    enum DidotWeight {
        case regular, italic, bold
        
        public var fontName: String {
            switch self {
            case .regular: return "Didot-Regular"
            case .italic: return "Didot-Italic"
            case .bold: return "Didot-Bold"
            }
        }
    }
}

private extension Font.TextStyle {
    func didotFontName() -> String {
        switch self {
        case .body, .caption, .subheadline:
            return Font.DidotWeight.regular.fontName
        case .footnote, .headline, .callout:
            return Font.DidotWeight.italic.fontName
        case .caption2, .largeTitle, .title, .title2, .title3:
            return Font.DidotWeight.bold.fontName
        @unknown default:
            fatalError()
        }
    }
    
    func standardSize() -> CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline, .body, .callout: return 17
        case .subheadline: return 15
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: fatalError()
        }
    }
}
