//
//  User.swift
//  VPMultiSelect_Example
//
//  Created by pioner on 01.09.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(lastName: String, firstName: String, age: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
