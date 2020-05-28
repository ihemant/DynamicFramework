//
//  ViewController.swift
//  DynamicFrameworkClient
//
//  Created by Hemant13 Kumar on 25/05/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit
import DynamicFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller = FirstViewController()
       let vcontroller =  controller.getViewController()
        self.navigationController?.show(vcontroller, sender: self)
       // self.present(vcontroller, animated: true, completion: nil)
        
      
//        let controller = FirstViewController()
//        controller.openCovidStatics()
        // Do any additional setup after loading the view.
    }


}

