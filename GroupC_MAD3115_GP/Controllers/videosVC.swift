//
//  videosVC.swift
//  GroupC_MAD3115_GP
//
//  Created by MacStudent on 2019-11-19.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit
import WebKit

class videosVC: UIViewController {

    
    var d_Web: WebVC?
    var YT_url = "https://www.youtube.com/results?search_query="
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let postFix = (d_Web?.nameofRecipe!.replacingOccurrences(of: " ", with: "+"))!
        print("hi")
        
        YT_url += postFix
        print(YT_url)
        let web_view = WKWebView(frame: view.frame)
        view.addSubview(web_view)
        let url = URL(string: YT_url)
        let request = URLRequest(url: url!)
        web_view.load(request)
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
