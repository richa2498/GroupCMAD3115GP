//
//  API.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import Foundation


    //  MARK: VARIABLES
var isFirstLoad = true
var fav_urls: [URL] = []
var fav_results : [Result] = []
dynamic var yt_Videos : YTVideo? = nil


    //  MARK: FUCtionS

func fetchVideos(nameOfRecipe: String) {
    var recipeName = nameOfRecipe
    recipeName = recipeName.replacingOccurrences(of: "\n", with: "", options: .caseInsensitive)
    recipeName = recipeName.replacingOccurrences(of: "\r", with: "", options: .caseInsensitive)
    recipeName = recipeName.replacingOccurrences(of: "\t", with: "", options: .caseInsensitive)
    recipeName = recipeName.replacingOccurrences(of: " ", with: "%20", options: .caseInsensitive)
    
//    print("fetchVideos : ")
        if let url = URL(string: (BASE_YT_URL_Prefix+"&q="+"\(recipeName.replacingOccurrences(of: " ", with: "%20"))"+BASE_YT_URL2_Suffix)) {
        print("VIDEO URL: ",url)
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard data == nil else {
                if let _ = String(data: data!, encoding: .utf8){

                    do {
                            let ytVideo = try JSONDecoder().decode(YTVideo.self, from: data!)
                            yt_Videos = ytVideo
                            loadImage(items: ytVideo.items)
//                            ytVideo.items.forEach { (i) in
//                                print(i.snippet.title)
//                                print(i.snippet.thumbnails.high.url)
//                              }
                    }catch{
                        print(error)
                    }
                }
                return
            }
        }.resume()
    }
        
    }


func loadImage(items: [Item]) {
    images = []
    items.forEach { (item) in
        DispatchQueue.global(qos: .userInitiated).async {
            do{
                let data = try Data(contentsOf: URL(string: (item.snippet.thumbnails.high.url))!)
                images.append(data)
            }catch{
                print("Unable to load data: \(error)")
            }
        }
    }
}


    //  MARK: URLS
let BASE_URL: String = "http://www.recipepuppy.com/api/"
let API_KEY: String = "AIzaSyDCZf2tqGBbSPs4SFF5x7-7QSWinG_uyN4"
let BASE_YT_URL_Prefix: String = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50"

//https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&q=monsoon&type=video&page=1&key=AIzaSyBc1_kSg50Pq3-8v9RxQBzxc7G-izAZGRo

let BASE_YT_URL2_Suffix: String = "&type=video&key=\(API_KEY)"

let YT_PLAY_URL: String = "https://www.youtube.com/embed/"
//  "https://www.youtube.com/watch?v="
















//monsoon :https://www.youtube.com/results?search_query=monsoon+recipes+with+ingredients
//summer : https://www.youtube.com/results?search_query=summer+recipes+with+ingredients
//winter : https://www.youtube.com/results?search_query=winter+recipes+with+ingredients
//fall   : https://www.youtube.com/results?search_query=fall+recipes+with+ingredients


//Morning : https://www.youtube.com/results?search_query=morning+easy+breakfast
//evening : https://www.youtube.com/results?search_query=dessert+recipes+easy+at+home



