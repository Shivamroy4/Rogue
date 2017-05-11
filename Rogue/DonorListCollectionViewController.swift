//
//  DonorListCollectionViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 18/03/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit
import Firebase


class DonorListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var donors = [User]()
    
    var filtereddonors = Set<User>()
  
    var bloodsearched = "A+"
    
    var  donorset = [User]()
    
    
    override func viewDidLoad()
    {
        
        
        
        
        
        collectionView?.register(DonorCell.self, forCellWithReuseIdentifier: "Cell")
        
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.red.withAlphaComponent(0.6)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red.withAlphaComponent(0.6)]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "< Back", style: .plain, target: self, action: #selector(ShowHomeView))
        
        
        print(bloodsearched)
        fetchDonors()
        
       
    }
    
    
    
    
    
    func fetchDonors()
        
    {
        FIRDatabase.database().reference().child("Users").observe(.childAdded, with: { (snapshot) in
            
            
            
            
            if let dictionary = snapshot.value as? [String: Any]
            {
                let user = User()
                
                user.Name = dictionary["Name"] as! String?
                user.Email = dictionary["Email"] as! String?
                user.Phone = dictionary["Phone"] as! String?
                user.City = dictionary["City"] as! String?
                user.BloodType = dictionary["BloodType"] as! String?
                user.isDonor = dictionary["isDonor"] as! Bool?
                
                
                
                self.donors.append(user)
                
              //  print(self.donors)
                
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                
                
                
                
                
                // print(user.Name!, user.Email! , user.Phone! , user.City! , user.BloodType! , user.isDonor!)
                
                
            }
            
            
            self.filterDonors()
            self.printDonors()
            
            
            
            // print(snapshot)
        }, withCancel: nil)
        
        
    }
    
    
    
    
    
    
    func filterDonors()
    {
        for donor in donors
        {
            if(donor.BloodType == bloodsearched && donor.isDonor == true)
            {
                filtereddonors.insert(donor)
            }
        
        }
    }
    
    func printDonors()
    {
        donorset = Array(filtereddonors)
        for donor in filtereddonors
        {
            
            print("here")
            print(donor.Name!)
        }
    }
    
    
    
    
    func ShowHomeView()
    {
        let Homeviewcontroller = HomeViewController()
        let Homeviewwithnavigation = UINavigationController(rootViewController: Homeviewcontroller)
//        self.present(Homeviewwithnavigation, animated: true, completion: nil)
        
        
        
        // Animated custom  Present ViewController
        
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        present(Homeviewwithnavigation, animated: false, completion: nil)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return donors.count
        
        //return filtereddonors.count
        
        return filtereddonors.count    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DonorCell
        
     //   cell.donor = donors[indexPath.row]
        
        
        
        cell.donor = donorset[indexPath.row]
        
    
        // cell.backgroundColor = UIColor.blue
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: view.frame.width, height: view.frame.height/4.5)
    }
    
    
}









class DonorCell: UICollectionViewCell {
    
    
    
    var donor: User?
    
    {
        didSet{
     //   NameLabel.text = donor?.Name
            
         NameLabel.text = donor?.Name
        }
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        
        SetupViews()
    }
    
    
    
    let NameLabel: UILabel =
        {
            let label = UILabel()
            label.backgroundColor = UIColor.green
            label.text = "Name"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor.white
            label.textAlignment = .center
            
            
            return label
    }()
    
    func NameLabelConstraints()
    {
        
        
        NameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        NameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        NameLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        NameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
    func SetupViews()
    {
        backgroundColor = UIColor.blue
        addSubview(NameLabel)
        NameLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}











