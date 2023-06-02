//
//  StoreHome.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

struct StoreHome: View {
    @StateObject private var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Store()
                .environmentObject(router)
        }
    }
}

struct StoreHome_Previews: PreviewProvider {
    static var previews: some View {
        StoreHome()
    }
}
