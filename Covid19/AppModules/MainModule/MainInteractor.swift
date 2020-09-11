//
//  MainInteractor.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainInteractor Class
final class MainInteractor: Interactor {
}

// MARK: - MainInteractor API
extension MainInteractor: MainInteractorApi {
    func getSummary() {
        BaseAPI.shared.loadInfo { [weak self] (response, error) in
            
            DispatchQueue.main.async {
                if let response = response {
                    self?.presenter.summaryDidLoaded(with: response)
                } else {
                    self?.presenter.errorDidLoaded()
                }
            }
        }
    }
}

// MARK: - Interactor Viper Components Api
private extension MainInteractor {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
