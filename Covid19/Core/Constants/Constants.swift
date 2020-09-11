//
//  Constants.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let lastAcitivtyDate = "lastAcitivtyDate"
    }
    
    struct Api {
        static let baseUrl = "https://api.covid19api.com"
        
        struct Routes {
            static let summary = "/summary"
        }
    }
}
