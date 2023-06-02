//
//  PrimaryButton.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

public struct PrimaryButton: View {
    private let text: String
    private let action: () -> Void
    
    public init(_ text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(text, action: action)
            .buttonStyle(.primary)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PrimaryButton("Tap me!") {}
            PrimaryButton("No, tap me!") {}
                .controlSize(.small)
            PrimaryButton("I'm the one you want") {}
                .controlSize(.mini)
        }
        .padding()
    }
}
