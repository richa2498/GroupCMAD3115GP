//
//  RecipeTBC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-20.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class RecipeTBC: UITabBarController {

    var searchVC: SearchVC?
    var url: URL?
    var nameOfRecipe: String?
    var ytVideo: YTVideo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            if self.searchVC != nil{
            self.fetchVideos(nameOfRecipe: (self.searchVC?.tableData[self.searchVC!.selected])!)
                
            }else{
                if self.nameOfRecipe != nil{
                    self.fetchVideos(nameOfRecipe: self.nameOfRecipe!)
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        print("RECIPETBC: ",url)
        selectedIndex = 0
        onTabChange()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let webVC: WebVC = segue.destination as? WebVC{
//            webVC.searchVC = self.searchVC
//            webVC.nameofRecipe = searchVC?.tableData[searchVC!.selected]
//        }
//
//        if let videosTVC: VideosTVC = segue.destination as? VideosTVC {
//            videosTVC.searchVC = self.searchVC
//            videosTVC.ytVideo = self.ytVideo
//        }
    }
    
    func onTabChange() {
        if selectedIndex == 0{
            let webVC = viewControllers![selectedIndex] as? WebVC
            print("webvc")
            webVC!.searchVC = self.searchVC
            webVC?.url = url
            webVC?.nameofRecipe = nameOfRecipe
        }
        
        if selectedIndex == 1{
            let videosTVC = viewControllers![selectedIndex] as? VideosTVC
            print("videotvc")
            videosTVC!.searchVC = self.searchVC
            videosTVC!.ytVideo = self.ytVideo
        }
    }
    
    func fetchVideos(nameOfRecipe: String) {
        if let url = URL(string: (BASE_YT_URL_Prefix+"&q="+"\(nameOfRecipe.replacingOccurrences(of: " ", with: "%20"))"+BASE_YT_URL2_Suffix)) {
        print(url)
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            guard data == nil else {
                if let _ = String(data: data!, encoding: .utf8){

                    do {
                            let ytVideo = try JSONDecoder().decode(YTVideo.self, from: data!)
                            self.ytVideo = ytVideo
//                            ytVideo.items.forEach { (i) in
//                            print(i.snippet.title)
                    }catch{
                        print(error)
                    }
                }
                return
            }
        }.resume()
    }
        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        selectedIndex = (tabBar.items?.firstIndex(of: item))!
        print(selectedIndex)
        onTabChange()
        }
    }

//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//        switch item.title {
//        case "Recipe":
//
//            return
//
//        case "Videos":
//            if let videosTVC = selectedViewController as? VideosTVC{
//                videosTVC.searchVC = self.searchVC
//                videosTVC.ytVideo = self.ytVideo
//            }
//            return
//
//        default:
//            return
//        }
//    }

