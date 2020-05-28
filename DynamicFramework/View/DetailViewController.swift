//
//  DetailViewController.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 22/04/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var regionalData : [Regional]?
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


extension DetailViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return regionalData?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let regionalDataObject = regionalData?[section]

        return regionalDataObject?.loc ?? "Location"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell
        let regionalDataObject = regionalData?[indexPath.section]
        cell?.totalCountLabel.text  =     "TotalConfirmed : \(regionalDataObject?.totalConfirmed ?? 0)"
        cell?.confirmedCasesIndian.text  =     "ConfirmedCasesIndian : \(regionalDataObject?.confirmedCasesIndian ?? 0)"
        cell?.confirmedCasesForeign.text  =     "ConfirmedCasesForeign : \(regionalDataObject?.confirmedCasesForeign ?? 0)"
        cell?.deaths.text  =     "Deaths : \(regionalDataObject?.deaths ?? 0)"
        cell?.discharged.text  =     "Discharged : \(regionalDataObject?.discharged ?? 0)"
        
        if regionalDataObject?.totalConfirmed ?? 0 > 100{
            cell?.backGroundView?.backgroundColor = UIColor.red
        }
        else{
            if #available(iOS 13.0, *) {
                cell?.backGroundView?.backgroundColor = UIColor.systemGroupedBackground
            } else {
                // Fallback on earlier versions
            }

        }


        return cell ?? ListTableViewCell()
    }
    
    
}
