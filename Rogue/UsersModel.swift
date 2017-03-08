//
//  UsersModel.swift
//  Rogue
//
//  Created by Shivam Roy on 28/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit
extension SignUpViewController
{

    class Users: NSObject
{
    var Name: String?
    var Email: String?
    var Password: String?
    var Phone: String?
    var  City: String?
    var BloodType: String?
    var isDonor: Bool?

        //    {
//        case Ap = "A+"
//        case An = "A-"
//        case Bp = "B+"
//        case Bn = "B-"
//        case Op = "O+"
//        case On = "O-"
//        case ABp = "AB+"
//        case ABn = "AB-"
//    }
    
    
    
        init(Name: String,Email: String,Password: String,Phone: String,City: String,BloodType: String,isDonor: Bool)
        {
            
            self.Name = Name
            self.Email = Email
            self.Password = Password
            self.Phone = Phone
            self.City = City
            self.isDonor = isDonor
            self.BloodType = BloodType
            
          
         
            
            
        }
        
}
}
