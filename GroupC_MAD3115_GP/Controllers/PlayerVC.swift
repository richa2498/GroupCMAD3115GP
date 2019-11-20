//
//  PlayerVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-20.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit
import WebKit


class PlayerVC: UIViewController {

    var item: Item?
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.frame)
        view.addSubview(webView!)
        start()
    }
    
    func start() {
        DispatchQueue.main.async {
            let request = URLRequest(url: URL(string: (YT_PLAY_URL + (self.item?.id.videoID)!))!)
            self.webView!.load(request)
        }
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
