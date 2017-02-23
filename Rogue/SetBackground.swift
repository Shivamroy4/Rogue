//
//  SetBackground.swift
//  Rogue
//
//  Created by Shivam Roy on 22/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit

extension UIViewController {
    func SetBackground()
    {
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "red-bg")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
                
        
    }

}
