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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let web_view = WKWebView(frame: view.frame)
        view.addSubview(web_view)
        let url = URL(string: (d_search?.URL_List[d_search!.selected])!)
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
