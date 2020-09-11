//
//  BaseAPI.swift
//  Covid19
//
//  Created by Rezo Joglidze on 9/9/20.
//  Copyright © 2020 Rezo Joglidze. All rights reserved.
//

import Foundation
import Network

class BaseAPI {
    static let shared = BaseAPI()

    
    func loadInfo(completionHandler: @escaping (Summary?, Error?) -> Void) {
        
        guard let url = URL(string: Constants.Api.baseUrl + Constants.Api.Routes.summary) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            if let response = try? JSONDecoder().decode(Summary.self, from: data) {
                completionHandler(response, nil)
            } else {
                completionHandler(nil,error)
            }
        }
        task.resume()
    }
}
