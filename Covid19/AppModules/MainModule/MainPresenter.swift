//
//  MainPresenter.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainPresenter Class
final class MainPresenter: Presenter {
    
    override func viewHasLoaded() {
        view.startLoading()
        interactor.getSummary()
    }
}

// MARK: - MainPresenter API
extension MainPresenter: MainPresenterApi {
 
    func summaryDidLoaded(with summary: Summary) {
        view.updateData(with: summary)
    }
    
    func didTapCollectionViewItem(country: Country) {
         router.goToAdditionalInfo(country: country)
     }
     
    func didGetConnectionError() {
        router.showConnectionErrorAlert()
    }
    
    func errorDidLoaded() {
        router.showAPICallErrorAlert()
    }
}

// MARK: - Main Viper Components
private extension MainPresenter {
    var view: MainViewApi {
        return _view as! MainViewApi
    }
    var interactor: MainInteractorApi {
        return _interactor as! MainInteractorApi
    }
    var router: MainRouterApi {
        return _router as! MainRouterApi
    }
}
