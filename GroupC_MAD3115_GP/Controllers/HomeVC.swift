//
//  HomeVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var evening: UILabel!
    @IBOutlet weak var morning: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

           // Fade out to set the text
              UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
              self.morning.alpha = 0.0
                   self.evening.alpha = 0.0
              }, completion: {
                  (finished: Bool) -> Void in
   
                  //Once the label is completely invisible, set the text and fade it back in
   
                  // Fade in
                UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                      self.morning.alpha = 2.0
                    self.evening.alpha = 2.0
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
