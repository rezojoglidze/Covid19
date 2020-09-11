//
//  MainModuleApi.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Viperit

//MARK: - MainRouter API
protocol MainRouterApi: RouterProtocol {
    func goToAdditionalInfo(country: Country)
    func showConnectionErrorAlert()
    func showAPICallErrorAlert()
}

//MARK: - MainView API
protocol MainViewApi: UserInterfaceProtocol {
    func updateData(with summary: Summary)
    func showLastActivity(isEmpty: Bool)
    func startLoading()
}

//MARK: - MainPresenter API
protocol MainPresenterApi: PresenterProtocol {
    
    //Interactor -> Presenter
    func summaryDidLoaded(with summary: Summary)
    func errorDidLoaded()
    
    //View -> Presenter
    func didTapCollectionViewItem(country: Country)
    func didGetConnectionError()
    func didTapRefreshBtn()
    
    //router -> Presenter
    func lastActivityDidLoad(isEmpty: Bool)
}

//MARK: - MainInteractor API
protocol MainInteractorApi: InteractorProtocol {
    func checkNetworkConnection()
}
