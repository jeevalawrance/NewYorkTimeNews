//
//  ApiManager.swift
//  NYNewsTimes
//
//  Created by Jeeva on 16/12/20.
//


import UIKit
import Alamofire

class ApiManager: NSObject {
 
     func getRequest(section : String,period : Int,params : Parameters = [:], completionHandler: @escaping (Mostpopular?, Bool) -> Void)-> Void {
                
        let url = "\(ApiEndpoints.SERVER_BASE_URL)\(ApiEndpoints.API_MOSTVIEWED)\(section)/\(period).json?api-key=\(Constants.API_KEY)"

        Alamofire.request(url, method: .get, parameters: params.isEmpty ? nil : params, encoding: JSONEncoding.default).validate(statusCode: 200..<299).responseJSON(completionHandler: { response in
            
            if response.response?.statusCode == 500 {
                print(response)
                completionHandler(nil, false)
            } else {
                if response.result.isSuccess {
                    if let JSON = response.result.value {
                        debugPrint("✅ Respons Object >>>> " + String(describing: JSON))
                        let decoder = JSONDecoder()
                        do {
                            let mostPopular = try decoder.decode(Mostpopular.self, from: response.data!)
                            completionHandler(mostPopular, true)
                        } catch {
                            print(error.localizedDescription)
                            completionHandler(nil, false)
                        }
                    }
                } else {
                    debugPrint("❌ 😝 Response fail : \(response.result.description)")
                }
            }
        })
        
    }
}
