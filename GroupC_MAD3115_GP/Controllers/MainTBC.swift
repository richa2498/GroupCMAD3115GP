//
//  MainTBC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class MainTBC: UITabBarController {

    //  MARK: Outlets
    @IBOutlet weak var navBar: UINavigationItem!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "Make my dish"
        navigationController?.navigationBar.prefersLargeTitles = true
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

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.title {
        case "Home":
            navBar.title = "Make my dish"
            return
        
        case "Search":
            navBar.title = "Search"
            return
            
        case "Favourite":
            navBar.title = "Favourite"
            return
       
        default:
            return
        }
    }
    
}
