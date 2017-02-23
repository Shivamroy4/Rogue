//
//  SignUpViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 23/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(HandleCancel))
       
        
        
        self.SetBackground()
        self.dismissKeyboard()
        
        
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func HandleCancel()
    {
        let LoginController = LoginViewController()
//        let LoginControllerwithNaviagtion = UINavigationController(rootViewController: LoginController)
        present(LoginController, animated: true, completion: nil)
        
    }
}
