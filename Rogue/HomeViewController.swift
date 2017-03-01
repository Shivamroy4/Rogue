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
        
        
        // If User is not logged in
        
        if FIRAuth.auth()?.currentUser?.uid == nil
        {
            performSelector(inBackground: #selector(HandleLogout), with: nil)
        }
        
    }
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    func HandleLogout()
    {
        // Logout User
        
        do
        {
            try FIRAuth.auth()?.signOut()
        }
        catch let logoutError
        {
            print(logoutError)
        }
        
        
        
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

