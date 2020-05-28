//
//  NetworkManager.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 04/02/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit
import Alamofire


class NetworkManager{
    
   // typealias webServiceResponse = (Post?,Error?)-> Void
    
    func execute(url : URL ,completionHandler :@escaping (Json4Swift_Base?,Error?)-> Void){
        AF.request(url).validate().responseData { (response) in
            if let errorResponse = response.error{
                completionHandler(nil,errorResponse)
            }
            if let jsonArray =  response.data {
                do{
                    let jsonDecoder = JSONDecoder()
                           let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: jsonArray)
                    completionHandler(responseModel,nil)
                }
                catch let error {
                    print(error)
                }
                completionHandler(nil,nil)
            }
        }
        
        
       
    }
    
    func execute(url : URL){
        
        AF.request(url).validate().responseJSON { (response) in
            
        }
        
    }

}
