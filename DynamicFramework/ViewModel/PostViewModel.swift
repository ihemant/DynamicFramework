//
//  PostViewModel.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 04/02/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit
let urlString  = "https://api.rootnet.in/covid19-in/stats/latest"

class PostViewModel: NSObject {
    
    var displayText = ""
    private let networManager = NetworkManager()
    
    func execute(completionHandler :@escaping (Json4Swift_Base?,Error?)-> Void){
        guard let urlExecute = URL.init(string: urlString)else {
                  return
              }
              networManager.execute(url: urlExecute) { (response , error) in
                  if let error = error{
                    self.displayText = error.localizedDescription
                    completionHandler(nil,error)
                  }
                  else if let json = response {
                    if let dataObject = json.data{
                        let date = self.getDate(dateString: json.lastRefreshed ?? "")
                        let originUpdate = self.getDate(dateString: json.lastOriginUpdate ?? "")

                        let  displayString = "******* Last Refreshed ******* \n \(date ?? Date()) \n\n ******* Last Origin Update ******* \n \(originUpdate ?? Date()) \n\n****************** Summary *************** \n Total : \(dataObject.summary?.total ?? 0)\n ConfirmedCasesIndian : \(dataObject.summary?.confirmedCasesIndian ?? 0)\n ConfirmedCasesForeign : \(dataObject.summary?.confirmedCasesForeign ?? 0)\n Deaths : \(dataObject.summary?.deaths ?? 0)\n\n ************* Unofficial Summary *********** \n Source : \(dataObject.unofficialSummary?.first?.source ?? "") \n Total : \(dataObject.unofficialSummary?.first?.total ?? 0) \n Recovered : \(dataObject.unofficialSummary?.first?.recovered ?? 0) \n Deaths : \(dataObject.unofficialSummary?.first?.deaths ?? 0) \n Active : \(dataObject.unofficialSummary?.first?.active ?? 0)"
                    self.displayText =  displayString
                        
                    }
                    completionHandler(json,error)

                  }
                  
              }
        
    }
    
    func getDate(dateString : String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: dateString) // replace Date String
    }

}


extension String {
  func toDate(withFormat format: String = "dd-MM-yyyy hh:mm:ss a") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}
