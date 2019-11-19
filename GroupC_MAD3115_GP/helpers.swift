//
//  API.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import Foundation


let BASE_URL: String = "http://www.recipepuppy.com/api/"
let API_KEY: String = "AIzaSyBc1_kSg50Pq3-8v9RxQBzxc7G-izAZGRo"
let BASE_YT_URL_Prefix: String = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50"

//https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=monsoon&type=video&page=1&key=AIzaSyBc1_kSg50Pq3-8v9RxQBzxc7G-izAZGRo

let BASE_YT_URL2_Suffix: String = "&type=video&key=\(API_KEY)"

//monsoon :https://www.youtube.com/results?search_query=monsoon+recipes+with+ingredients
//summer : https://www.youtube.com/results?search_query=summer+recipes+with+ingredients
//winter : https://www.youtube.com/results?search_query=winter+recipes+with+ingredients
//fall   : https://www.youtube.com/results?search_query=fall+recipes+with+ingredients


//Morning : https://www.youtube.com/results?search_query=morning+easy+breakfast
//evening : https://www.youtube.com/results?search_query=dessert+recipes+easy+at+home



