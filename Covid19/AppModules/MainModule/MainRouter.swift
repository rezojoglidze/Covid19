//
//  MainRouter.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Viperit

// MARK: - MainRouter class
final class MainRouter: Router {
    
    func showAlert(message: String,title: String ) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: title, style: .default) { UIAlertAction in
            self.checkUserDefaultIsEmpty()
        }
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func checkUserDefaultIsEmpty() {
        if UserDefaults.standard.structArrayData(Country.self, forKey: Constants.Keys.lastAcitivtyDate).isEmpty {
            self.presenter.lastActivityDidLoad(isEmpty: true)
            print("carieliaa")
        } else {
            self.presenter.lastActivityDidLoad(isEmpty: false)
            print("ar aris carieli")
        }
    }
}

// MARK: - MainRouter API
extension MainRouter: MainRouterApi {
    
    func goToAdditionalInfo(country: Country) {
        let module = AppModules.additionalInfo.build()
        module.router.show(from: viewController, embedInNavController: false, setupData: country)
    }
    
    func showConnectionErrorAlert() {
        showAlert(message: "ინტერნეტთან დაკავშირება ვერ მოხერხდა", title: "გასაგებია")
    }
    
    func showAPICallErrorAlert() {
        showAlert(message: "მოხდა შეფერხება, სცადეთ მოგვიანებით", title: "გასაგებია")
    }
}

// MARK: - Main Viper Components
private extension MainRouter {
    var presenter: MainPresenterApi {
        return _presenter as! MainPresenterApi
    }
}
