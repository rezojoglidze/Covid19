//
//  AdditionalInfoModuleApi.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Viperit

//MARK: - AdditionalInfoRouter API
protocol AdditionalInfoRouterApi: RouterProtocol {
}

//MARK: - AdditionalInfoView API
protocol AdditionalInfoViewApi: UserInterfaceProtocol {
    func updateView(country: Country)
}

//MARK: - AdditionalInfoPresenter API
protocol AdditionalInfoPresenterApi: PresenterProtocol {
}

//MARK: - AdditionalInfoInteractor API
protocol AdditionalInfoInteractorApi: InteractorProtocol {
}
