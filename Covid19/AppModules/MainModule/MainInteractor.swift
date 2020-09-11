//
//  MainInteractor.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit
import Network

// MARK: - MainInteractor Class
final class MainInteractor: Interactor {
    
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

// MARK: - MainInteractor API
extension MainInteractor: MainInteractorApi {
    
    func checkNetworkConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.getSummary()
            } else {
                print("There's no internet connection.")
                DispatchQueue.main.async {
                    self.presenter.didGetConnectionError()
                }
            }
        }
        monitor.start(queue: queue)
    }
}

// MARK: - Interactor Viper Components Api
private extension MainInteractor {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
