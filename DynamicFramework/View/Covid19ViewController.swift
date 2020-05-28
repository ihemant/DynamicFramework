//
//  Covid19ViewController.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 25/05/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit

public class Covid19ViewController: UIViewController {
        
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Covid-19 Tracker"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

       // let controller 
        // Do any additional setup after loading the view.
    }
    
    @objc public static func openCovid19Controller(){
             print("i am in covid19 controller")
        
       
    }

    @objc func addTapped(){
        
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
