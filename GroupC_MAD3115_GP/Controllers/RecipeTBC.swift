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
    var fvtVC: FavouriteVC?
    var url: URL?
    var nameOfRecipe: String?
    var ytVideo: YTVideo?
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var tab: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.backgroundColor = #colorLiteral(red: 0.1458176076, green: 0.1732214689, blue: 0.3447553813, alpha: 1)
        
        let nav1 = UINavigationController()
        navBar.title = nameOfRecipe
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let first: WebVC = mainStoryboard.instantiateViewController(withIdentifier: "Recipe") as! WebVC
            first.searchVC = searchVC
            first.nameofRecipe = nameOfRecipe
            first.url = url
           nav1.viewControllers = [first]
           nav1.setNavigationBarHidden(true, animated: true)
           nav1.title = "Recipe"
        
        let nav2 = UINavigationController()
        let second: VideosTVC = mainStoryboard.instantiateViewController(withIdentifier: "Videos") as! VideosTVC
        second.searchVC = searchVC
        
        nav2.viewControllers = [second]
        nav2.setNavigationBarHidden(true, animated: true)
        nav2.title = "Videos"
        
        
        DispatchQueue.main.async {
            if self.searchVC != nil{
                fetchVideos(nameOfRecipe: (self.nameOfRecipe!))
                self.viewControllers = [nav1, nav2]
            }else{
                if self.nameOfRecipe != nil{
                    fetchVideos(nameOfRecipe: self.nameOfRecipe!)
                    self.viewControllers = [nav2]
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
//        print("RECIPETBC: ",url)
        
        self.tabBarController?.view.window!.rootViewController = self.tabBarController
        tabBarController?.selectedIndex = 0
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        navBar.title = item.title
        switch item.title {
        case "Recipe":
            if let webVC = viewControllers![selectedIndex] as? WebVC{
            print("webvc")
                if searchVC != nil{
                    webVC.searchVC = self.searchVC
                    webVC.url = url
                    webVC.nameofRecipe = nameOfRecipe
                }
            }
            return

        case "Videos":
            if (selectedViewController as? VideosTVC) != nil{
                let videosTVC = viewControllers![selectedIndex] as? VideosTVC
                videosTVC!.searchVC = self.searchVC
            }
            return

        default:
            return
        }
    }
    
}


/*
 
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
 
 
 */
