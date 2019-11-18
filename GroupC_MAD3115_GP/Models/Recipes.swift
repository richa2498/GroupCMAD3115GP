//
//  Recipes.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import Foundation

// MARK: - Recipes
struct Recipes: Codable {
    let title: String
    let version: Double
    let href: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let href: String
    let ingredients: String
    let thumbnail: String
}
