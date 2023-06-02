//
//  AppTabs.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

enum Tabs: Int {
    case store, bag, account
}
struct AppTabs: View {
    @EnvironmentObject var tabs: TabRouter
    
    var body: some View {
        TabView(selection: $tabs.selectedTab) {
            store
            bag
            account
        }
        .onAppear {
            styleTabBar()
        }
        //TODO: - create FullscreenLoader view
//        .loaderPresentation()
    }
}

@MainActor
private extension AppTabs {
    var store: some View {
        StoreHome().tabItem {
            
        }
    }
    
    var bag: some View {
        BagHome().tabItem {
            
        }
    }
    
    var account: some View {
        AccountHome().tabItem {
            
        }
    }
    
    func styleTabBar() {
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.didot(weight: .regular, size: 17)
        ]
        navigationAppearance.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.didot(weight: .bold, size: 28)
        ]
        navigationAppearance.shadowColor = .white
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
    }
}

struct AppTabs_Previews: PreviewProvider {
    static var previews: some View {
        AppTabs()
    }
}
