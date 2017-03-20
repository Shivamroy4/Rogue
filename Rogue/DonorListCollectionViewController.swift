//
//  DonorListCollectionViewController.swift
//  Rogue
//
//  Created by Shivam Roy on 18/03/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit


class DonorListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad()
    {
        
        
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.tintColor = UIColor.red.withAlphaComponent(0.6)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red.withAlphaComponent(0.6)]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "< Back", style: .plain, target: self, action: #selector(ShowHomeView))
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
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
    
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: view.frame.width, height: view.frame.height/6)
    }
}
