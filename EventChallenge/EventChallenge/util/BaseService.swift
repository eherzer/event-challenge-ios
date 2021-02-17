//
//  BaseService.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseService {
    func request(endpoint: String, method: HTTPMethod, parameters: Parameters? = nil, success: @escaping (_ jsonResponse: JSON?) -> Void, failure: @escaping (_ errorMessage: String?) -> Void) {
        let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
        let request = "\(baseUrl)\(endpoint)"
        
        AF.request(request, method: method, parameters: parameters).responseJSON { (response) in
            if let responseError = response.error {
                failure(responseError.localizedDescription)
                return
            }
            
            do {
                var jsonResponse: JSON?
                if let responseData = response.data {
                    jsonResponse = try JSON(data: responseData)
                }
                
                if let statusCode = response.response?.statusCode, statusCode < 300 {
                    success(jsonResponse)
                    return
                }
                
                if let errorMessage = jsonResponse?.string {
                    failure(errorMessage)
                    return
                }
                
                failure(nil)
            } catch {
                failure(error.localizedDescription)
            }
        }
    }
}
