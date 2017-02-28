//
//  ViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 21/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(HandleLogout))
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    func HandleLogout()
    {
        let LoginController = LoginViewController()
//        let LoginControllerwithNaviagtion = UINavigationController(rootViewController: LoginController)
//        present(LoginControllerwithNaviagtion, animated: true, completion: nil)
        present(LoginController, animated: true, completion: nil)
    }

    
    
       
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

