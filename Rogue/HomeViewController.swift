//
//  ViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 21/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController  {

    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "LogOut", style: .plain, target: self, action: #selector(HandleLogout))
        
        self.SetBackground()
        
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.red.withAlphaComponent(0.6)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red.withAlphaComponent(0.6)]
        
        
      
        
        // Prevent Navigation Bar form covering the view
        self.edgesForExtendedLayout = []

                
        
        
        view.addSubview(inputcontainerview)
        Setupinputconatinerview()
        
//        view.addSubview(CollectionView)
//        SetupCollectionView()
        
        
        
        
        
        
  
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
                
                // Display User Name on Navigation Bar
                
                if let dictionary = snapshot.value as? [String: AnyObject]
                {
                    self.navigationItem.title = dictionary["Name"] as? String
                }
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

    
    
    
    
    let inputcontainerview : UIView =
        {
            
            let view = UIView()
            view.backgroundColor = UIColor.black
            view.alpha = 0.6
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            
            return view
    }()
    
    
    
    func Setupinputconatinerview()
    {
        inputcontainerview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // inputcontainerview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputcontainerview.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        inputcontainerview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputcontainerview.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
    
 
        
        inputcontainerview.addSubview(BloodTypeControl)
        BloodTypeSegmentConstraints()
        
        
        inputcontainerview.addSubview(SearchButton)
        SearchButtonConstraints()

        
    }
    
   

    
    
    
    
    // Blood Type Segmented Control
    
    let BloodTypeControl: UISegmentedControl =
        {
            let sc = UISegmentedControl(items:["A+", "A-","B+", "B-", "O+", "O-", "AB+", "AB-"])
            sc.translatesAutoresizingMaskIntoConstraints = false
            sc.tintColor = UIColor.red
            
            
            return sc
    }()
    
    
 
   
    
    
    
    func BloodTypeSegmentConstraints()
    {
        BloodTypeControl.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        BloodTypeControl.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 16).isActive = true
        BloodTypeControl.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -30).isActive = true
        BloodTypeControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
    }

    
    
    
    
    // Search Button
    
    
    let SearchButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.red
        // button.alpha = 0.6
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.6).cgColor
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor.white.withAlphaComponent(1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        button.addTarget(self, action: #selector(SearchDonors), for: .touchUpInside )
        
        
        return button
      
    }()
    
    
    
    func SearchButtonConstraints()
    {
        SearchButton.centerXAnchor.constraint(equalTo: inputcontainerview.centerXAnchor).isActive = true
        SearchButton.topAnchor.constraint(equalTo: inputcontainerview.topAnchor, constant: 70).isActive = true
        SearchButton.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor, constant: -150).isActive = true
        SearchButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    
    
    func SearchDonors()
    {
        
            

        
        if BloodTypeControl.selectedSegmentIndex == -1
        {
            
            
            print("Select Blood Type")
            
        }
        else
        {
            
                let bloodint: Int = BloodTypeControl.selectedSegmentIndex
                let bloodtype: String = BloodTypeControl.titleForSegment(at: bloodint)!
            
                print(bloodtype)
            
            let Donorlistviewcontroller = DonorListCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
            let Donorviewwithnavigation = UINavigationController(rootViewController: Donorlistviewcontroller)
            self.present(Donorviewwithnavigation, animated: true, completion: nil)
            
            
        }
        
       
        
        
      
       
    }
    
    // Collection View
    
//    let CollectionView: UICollectionView =
//    {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.green
//        return cv
//    }()
//
//    func SetupCollectionView()
//    {
//        CollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        CollectionView.topAnchor.constraint(equalTo: inputcontainerview.bottomAnchor, constant: 10).isActive = true
//        CollectionView.widthAnchor.constraint(equalTo: inputcontainerview.widthAnchor).isActive = true
//        CollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.60).isActive = true
//
//        
//    }
//    
    
    
    


}

