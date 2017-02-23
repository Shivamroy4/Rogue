//
//  DismissKeyboard.swift
//  Rogue
//
//  Created by Shivam Roy on 22/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit


extension UIViewController {
    func DismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

