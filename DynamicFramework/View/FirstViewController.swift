//
//  ViewController.swift
//  AlomofireSample
//
//  Created by Hemant13 Kumar on 04/02/20.
//  Copyright © 2020 Hemant13 Kumar. All rights reserved.
//

import UIKit

 open class FirstViewController: UIViewController {
    
    private let viewModel = PostViewModel()
    private var regionalData : [Regional]?

    @IBOutlet weak var executeButton: UIButton!
    @IBOutlet weak var displayTextView: UITextView!
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Covid-19 Tracker"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))

        viewModel.execute { (responseObject, error) in
            if let regionalDetailData = responseObject?.data?.regional{
                self.regionalData = regionalDetailData
                self.displayTextView.text = self.viewModel.displayText
            }
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func executeAction(_ sender: Any) {
        self.displayTextView.text = viewModel.displayText
    }
    
    @objc func addTapped(){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as UIViewController
//        navigationController?.pushViewController(vc, animated: true)
        // Safe Push VC
        let bundle = Bundle(for: DetailViewController.self)

        if let viewController = UIStoryboard(name: "Main", bundle: bundle).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.regionalData = self.regionalData
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    @objc public func  openCovidStatics(){
        viewModel.execute { (responseObject, error) in
            if let regionalDetailData = responseObject?.data?.regional{
                self.regionalData = regionalDetailData
              //  self.addTapped()
            }
        }
}
    @objc public func getViewController() -> UIViewController{
         let bundle = Bundle(for: FirstViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: "navigationcontroller") as! UINavigationController
       // vc.viewDidLoad()
        //navigationController?.pushViewController(vc, animated: true)
        return vc
    }
    
    
   @objc public  func presentFirstViewControllerOn(_ viewController:UIViewController) {
    
//    var frameworkDirPath = Bundle.main.privateFrameworksPath
//    var frameworkBundlePath = frameworkDirPath?.appending("DynamicFramework.framework")
//
//    NSString *frameworkDirPath = [[NSBundle mainBundle] privateFrameworksPath];
//        NSString *frameworkBundlePath = [frameworkDirPath stringByAppendingPathComponent:@"JioChatSDK.framework"];
//        NSBundle *frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
//        NSString *internalBundlePath = [frameworkBundle pathForResource:@"JioChatSDK" ofType:@"bundle"];
//        NSBundle *subBundle = [NSBundle bundleWithPath:internalBundlePath];

    let bundle = Bundle(for: FirstViewController.self)
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Covid19ViewController") as! Covid19ViewController
        viewController.present(nextViewController, animated:true, completion:nil)
    }
}

