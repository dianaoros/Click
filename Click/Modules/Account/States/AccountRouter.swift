//
//  AccountRouter.swift
//  Click
//
//  Created by Diana Oros on 6/1/23.
//  Copyright © 2023 Click. All rights reserved.
//

import SwiftUI

final class AccountRouter: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func popToRoot() {
        navigationPath.removeLast(navigationPath.count)
    }
}
