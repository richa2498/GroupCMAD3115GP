//
//  Course.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import Foundation

struct Course : Decodable{
    let id : Int
    let name : String
    let link : String
    let imageUrl : String
    let number_of_lessons : Int
}
