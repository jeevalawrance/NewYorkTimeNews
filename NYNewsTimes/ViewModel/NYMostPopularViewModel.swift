//
//  NYMostPopularViewModel.swift
//  NYNewsTimes
//
//  Created by Jeeva on 17/12/20.
//

import UIKit
import Alamofire

class NYMostPopularViewModel: NSObject {
      
    let apiManager = ApiManager()
    
    public func getTopNewsList(section : String, period : Int, completionHandler: @escaping (Mostpopular?, Bool) -> Void)-> Void {
        apiManager.getRequest(section: section, period: period, params: [:]) { response,status  in
            if status
            {
                completionHandler(response, true)
            }
            else{
                completionHandler(nil, false)
            }
        }
    }
    
//    public func getTopNewsLists(section : String, period : Int, completionHandler: @escaping (DataResponse<Any>,Bool) -> Void)-> Void {
//        apiManager.getRequest(section: section, period: period) { statusCode in
//            
//        } successCallback: { response in
//            completionHandler(response as! DataResponse<Any>,true)
//        } errorCallback: { error in
//            print(error.localizedDescription)
//        }
//
//    }
}
