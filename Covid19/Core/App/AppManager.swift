//
//  AppManager.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import UIKit
import Viperit

struct AppManager {
    
    static func configureRootVC(in window: UIWindow?) {
        let module = AppModules.main.build()
        module.router.show(inWindow: window, embedInNavController: true, setupData: false, makeKeyAndVisible: true)
    }
}

