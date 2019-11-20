//
//  WebVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Parth Dalwadi on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    var d_search: SearchVC?
    var ytVideo: YTVideo?
    var nameofRecipe: String?
        
    @IBOutlet weak var website_View: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
            start()
        nameofRecipe = (d_search?.tableData[d_search!.selected])!
            // Do any additional setup after loading the view.
        }
        
        func start() {
            let web_view = WKWebView(frame: website_View.frame)
            view.addSubview(web_view)
            let url = URL(string: (d_search?.URL_List[d_search!.selected])!)
            let request = URLRequest(url: url!)
            web_view.load(request)
             
            //fetchVideos(nameOfRecipe: nameOfRecipe!)
        }
// https://www.youtube.com/results?search_query=chocolate+chip+cookies+recipe
    /*
        func fetchVideos(nameOfRecipe: String) {
            if let url = URL(string: (BASE_YT_URL_Prefix+"&q="+"sandwich"+BASE_YT_URL2_Suffix)) {
            print(url)
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard data == nil else {
                    if let _ = String(data: data!, encoding: .utf8){

                        do {
                                let ytVideo = try JSONDecoder().decode(YTVideo.self, from: data!)
                                self.
                                ytVideo.items.forEach { (i) in
                                print(i.snippet.title)

                        }
                        } catch{
                            print(error)
                        }
                    }
                    return
                }
            }.resume()
        }
        }*/
        
         //MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            if let video = segue.destination as? videosVC{
                video.d_Web = self
                
                
            }
            
        }
        

    }

