//
//  SearchVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit


class SearchVC: UIViewController {

    //  MARK: Outlets
    @IBOutlet weak var searchTV: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var recipe_List = [String]()
    var URL_List = [String]()
    var selected = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    func start() {
        searchBar.delegate = self
        
        //searchTV.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
        fetchRecipes(searchFor: "?i=onions,garlic")
        
        
        
//        fetchCourses()
    }

    //  MARK: Actions
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        
    }
    
    func fetchRecipes(searchFor: String) {
        if let url = URL(string: (BASE_URL + searchFor)) {
            print(url)
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard data == nil else {
                    if let strData = String(data: data!, encoding: .utf8){
//                            print(strData)
                            do {
                                let recipes = try JSONDecoder().decode(Recipes.self, from: data!)
//                                print(recipes)
                                
                                recipes.results.forEach { (r) in
                                print(r.title)
                                self.recipe_List.append(r.title)
                                self.URL_List.append(r.href)
                                
                                    
                                }
                            } catch{
                                print(error)
                            }
                    }
                    return
                }
            }.resume()
        }
        
        
        
    }
        
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let web = segue.destination as? WebVC{
            web.d_search = self
        }
        
        if let cell_selected = sender as? UITableViewCell{
        
            selected = searchTV.indexPath(for: cell_selected)!.row
        }
    }
    

}

//  TableView delegates & datasource
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe_List.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = searchTV.dequeueReusableCell(withIdentifier: "RecipeCell"){
            
            var data = recipe_List[indexPath.row]
            data = data.replacingOccurrences(of: "\n", with: "")
            cell.textLabel?.text = data
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    
}


extension SearchVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTV.reloadData()
        print(recipe_List)
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
