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
    
    var searchVC: SearchVC?
    var url: URL?
    var nameofRecipe: String?
    var webView: WKWebView?
        
    @IBOutlet weak var website_View: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
        print("WEBVC: ",url)
            webView = WKWebView(frame: website_View.frame)
            view.addSubview(webView!)
            start()
//            nameofRecipe = (searchVC?.tableData[searchVC!.selected])!
            // Do any additional setup after loading the view.
    }
        
        func start() {
            DispatchQueue.main.async {
                if self.url != nil{
                    let request = URLRequest(url: self.url!)
                    self.webView!.load(request)
                }else{
                    print("empty url")
                }
            }
             
            //fetchVideos(nameOfRecipe: nameOfRecipe!)
        }
// https://www.youtube.com/results?search_query=chocolate+chip+cookies+recipe
        
         //MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        }
        

    }

