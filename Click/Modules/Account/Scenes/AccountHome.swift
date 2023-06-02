//
//  AccountHome.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

struct AccountHome: View {
    @StateObject var router = AccountRouter()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            Account()
                .navigationBarTitleDisplayMode(.large)
                .environmentObject(router)
        }
        .onActiveTabSelected(.account) {
            router.popToRoot()
        }
    }
}

struct AccountHome_Previews: PreviewProvider {
    static var previews: some View {
        AccountHome()
    }
}
