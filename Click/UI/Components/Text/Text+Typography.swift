//
//  Text+Typography.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public extension View {
    func largeTitle() -> some View {
        font(.brand(.largeTitle))
    }
    
    func title() -> some View {
        font(.brand(.title))
    }
    
    func title2() -> some View {
        font(.brand(.title2))
    }
    
    func title3() -> some View {
        font(.brand(.title3))
    }
    
    func headline() -> some View {
        font(.brand(.headline))
    }
    
    func body() -> some View {
        font(.brand(.body))
    }
    
    func callout() -> some View {
        font(.brand(.callout))
    }
    
    func subheadline() -> some View {
        font(.brand(.subheadline))
    }
    
    func footnote() -> some View {
        font(.brand(.footnote))
    }
    
    func caption() -> some View {
        font(.brand(.caption))
    }
    
    func caption2() -> some View {
        font(.brand(.caption2))
    }
}

public extension Text {
    static var space: Text { Text (" ") }
    
    func largeTitle() -> Text {
        font(.brand(.largeTitle))
    }
    
    func title() -> Text {
        font(.brand(.title))
    }
    
    func title2() -> Text {
        font(.brand(.title2))
    }
    
    func title3() -> Text {
        font(.brand(.title3))
    }
    
    func headline() -> Text {
        font(.brand(.headline))
    }
    
    func body() -> Text {
        font(.brand(.body))
    }
    
    func callout() -> Text {
        font(.brand(.callout))
    }
    
    func subheadline() -> Text {
        font(.brand(.subheadline))
    }
    
    func footnote() -> Text {
        font(.brand(.footnote))
    }
    
    func caption() -> Text {
        font(.brand(.caption))
    }
    
    func caption2() -> Text {
        font(.brand(.caption2))
    }
}

public extension Font {
    static func brand(_ style: Font.TextStyle, size: CGFloat? = nil) -> Font {
        .didot(style, size: size)
    }
}
