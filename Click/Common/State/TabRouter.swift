//
//  TabRouter.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

@MainActor
final class TabRouter: ObservableObject {
    @Published var selectedTab: Tabs = .store
    
    func reset() {
        selectedTab = .store
    }
}

struct ActiveTabSelected: ViewModifier {
    @EnvironmentObject var tabs: TabRouter
    @State var lastTab: Tabs?
    
    let tab: Tabs
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(tabs.$selectedTab.dropFirst()) { selectedTab in
                if selectedTab == tab, lastTab == tab {
                    action()
                }
                lastTab = selectedTab
            }
    }
}

extension View {
    func onActiveTabSelected(_ tab: Tabs, action: @escaping () -> Void) -> some View {
        modifier(ActiveTabSelected(tab: tab, action: action))
    }
}
