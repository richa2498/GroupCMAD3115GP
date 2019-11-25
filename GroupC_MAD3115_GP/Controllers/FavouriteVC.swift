//
//  FavouriteVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class FavouriteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var fvt_TV: UITableView!
    var fvt_currIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return fav_results.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = fvt_TV.dequeueReusableCell(withIdentifier: "fvtCell"){
            cell.textLabel?.text = fav_results[indexPath.row].title
        cell.imageView?.image = UIImage(named: "fvt_2")
        cell.selectionStyle = .none
            return cell}
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let del = UIContextualAction(style: .destructive, title: "Remove") { (action, V, _) in
            fav_results.remove(at: indexPath.row)
            self.fvt_TV.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [del])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fvt_TV.reloadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let fvtCell = sender as? UITableViewCell{
            
        fvt_currIndex = fvt_TV.indexPath(for: fvtCell)!.row
        }
        
        if let recipeTBC = segue.destination as? RecipeTBC{
            recipeTBC.fvtVC = self
            recipeTBC.url = URL(string: fav_results[fvt_currIndex].href)
            recipeTBC.nameOfRecipe = fav_results[fvt_currIndex].title
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
