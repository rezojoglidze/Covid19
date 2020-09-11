//
//  AdditionalInfoInteractor.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - AdditionalInfoInteractor Class
final class AdditionalInfoInteractor: Interactor {
}

// MARK: - AdditionalInfoInteractor API
extension AdditionalInfoInteractor: AdditionalInfoInteractorApi {
}

// MARK: - Interactor Viper Components Api
private extension AdditionalInfoInteractor {
    var presenter: AdditionalInfoPresenterApi {
        return _presenter as! AdditionalInfoPresenterApi
    }
}
