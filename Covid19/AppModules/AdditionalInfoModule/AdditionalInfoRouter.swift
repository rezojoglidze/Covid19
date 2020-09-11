//
//  AdditionalInfoRouter.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - AdditionalInfoRouter class
final class AdditionalInfoRouter: Router {
}

// MARK: - AdditionalInfoRouter API
extension AdditionalInfoRouter: AdditionalInfoRouterApi {
}

// MARK: - AdditionalInfo Viper Components
private extension AdditionalInfoRouter {
    var presenter: AdditionalInfoPresenterApi {
        return _presenter as! AdditionalInfoPresenterApi
    }
}
