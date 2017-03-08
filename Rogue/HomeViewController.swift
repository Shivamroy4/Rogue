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
        
        
        // If this poses any problem then call it from viewillapear
//        if FIRAuth.auth()?.currentUser?.uid == nil
//        {
//            performSelector(inBackground: #selector(HandleLogout), with: nil)
//        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
       
        if FIRAuth.auth()?.currentUser?.uid == nil
        {
            performSelector(inBackground: #selector(HandleLogout), with: nil)
        }
        else
        {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("Users").child(uid!).observe(.value, with: { (snapshot) in
                
                
                print(snapshot)
                
            }, withCancel: nil)
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

