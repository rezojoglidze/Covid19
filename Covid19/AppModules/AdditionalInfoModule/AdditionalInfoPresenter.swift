//
//  AdditionalInfoPresenter.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - AdditionalInfoPresenter Class
final class AdditionalInfoPresenter: Presenter {
    override func setupView(data: Any) {
        if let country = data as? Country {
            print("movoiiidaaa")
            print(country)
            self.view.updateView(country: country)
        }
    }
}

// MARK: - AdditionalInfoPresenter API
extension AdditionalInfoPresenter: AdditionalInfoPresenterApi {
}

// MARK: - AdditionalInfo Viper Components
private extension AdditionalInfoPresenter {
    var view: AdditionalInfoViewApi {
        return _view as! AdditionalInfoViewApi
    }
    var interactor: AdditionalInfoInteractorApi {
        return _interactor as! AdditionalInfoInteractorApi
    }
    var router: AdditionalInfoRouterApi {
        return _router as! AdditionalInfoRouterApi
    }
}
