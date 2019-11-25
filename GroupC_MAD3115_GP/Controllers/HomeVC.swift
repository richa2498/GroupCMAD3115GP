//
//  HomeVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var home: UITabBarItem!
    @IBOutlet weak var desert_img: UIImageView!
    @IBOutlet weak var morning_img: UIImageView!
    @IBOutlet weak var evening: UILabel!
    @IBOutlet weak var morning: UILabel!
    
    @IBOutlet weak var eveningView: UIView!
    @IBOutlet weak var morningView: UIView!
    @IBOutlet weak var monsoonView: UIView!
    @IBOutlet weak var summerView: UIView!
    @IBOutlet weak var fallView: UIView!
    @IBOutlet weak var winterView: UIView!
    
    var url : URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
      }
    
    func start() {
        eveningView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
        morningView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
        monsoonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
        summerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
        fallView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
        winterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapImage(_:))))
    }
    
    @objc func onTapImage(_ sender: UITapGestureRecognizer) {
        guard let recipeTBC: RecipeTBC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeTBC") as? RecipeTBC else { return }
        
        
        switch sender.view {
            case eveningView:
                recipeTBC.nameOfRecipe = "evening_recipes"
                
            case morningView:
                recipeTBC.nameOfRecipe = "morning_recipes"
            
            case monsoonView:
                recipeTBC.nameOfRecipe = "monsoon_recipes"
            
            case summerView:
                recipeTBC.nameOfRecipe = "summer_recipes"
            
            case fallView:
                recipeTBC.nameOfRecipe = "fall_recipes"
            
            case winterView:
                recipeTBC.nameOfRecipe = "winter_recipes"
            
            default:
                return
        }
//        print(recipeTBC.nameOfRecipe)
//        recipeTBC.url = self.url
        let navController = UINavigationController(rootViewController: recipeTBC)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.0, delay: 0.0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
                        self.monsoonView.alpha = 0.0
                        self.summerView.alpha =  0.0
                        self.winterView.alpha =  0.0
                        self.eveningView.alpha = 0.0
                        self.morningView.alpha = 0.0
                        self.fallView.alpha =    0.0
                   }, completion: {
                       (finished: Bool) -> Void in
        
                    UIView.animate(withDuration: 0.3, delay: 0.2, options: UIView.AnimationOptions.curveEaseIn, animations: {
                        self.monsoonView.alpha = 1.0
                        self.summerView.alpha =  1.0
                        self.winterView.alpha =  1.0
                        self.eveningView.alpha = 1.0
                        self.morningView.alpha = 1.0
                        self.fallView.alpha =    1.0
                           }, completion: nil)
               })
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



    
    
    

