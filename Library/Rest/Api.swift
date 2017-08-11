//
//  Api.swift
//  SimpleApiClient
//
//  Created by ShengHua Wu on 8/22/16.
//  Copyright © 2016 ShengHua Wu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Api{
    
    static let sharedInstance = Api()
    
    // MARK: - Private Properties
    fileprivate let manager: SessionManager
    
    // MARK: - Designated Initializer
    init() {
        self.manager = Configuration.manager
    }
    
    // MARK: - Public Methods
    func getUserInfo(completion: @escaping (ApiResult<[User]>) -> Void) {
        let urlString:URLConvertible = (Api.getBaseUrl() + "users")
        self.request(urlString).validate().responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value).array
                let users = User.modelsFromJSONArray(array: json! as NSArray)
                completion(ApiResult{ return users })
            case .failure(let error):
                completion(ApiResult{ throw error })
            }
        })
    }
    
    func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest {
        return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    
    static func getBaseUrl() -> String {
        guard let info = Bundle.main.infoDictionary,
            let urlString = info["Base url"] as? String else {
                fatalError("Cannot get base url from info.plist")
        }
        
        return urlString
    }
}



struct Configuration {
    static var manager: SessionManager {
        let configuration = URLSessionConfiguration.default
        
         return Alamofire.SessionManager(configuration: configuration)
    }
}
