//
//  UsersModel.swift
//  Rogue
//
//  Created by Shivam Roy on 28/02/17.
//  Copyright © 2017 ShivamRoy. All rights reserved.
//

import UIKit

class Users: NSObject
{
    var Name: String?
    var Email: String?
    var Password: String?
    var PhoneNumber: Int64?
    var  City: String?
    
    enum BloodType
    {
        case Ap
        case An
        case Bp
        case Bn
        case Op
        case On
        case ABp
        case ABn
    }
    
    var isDonor: Bool?
    
}
