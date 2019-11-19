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
    @IBOutlet weak var segment_search: UISegmentedControl!
    @IBOutlet weak var searchTV: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var recipe_List = [String]()
    var URL_List = [String]()
    var Ingradients_List = [String]()
    
    var tableData = [String]()
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
        
        if sender.selectedSegmentIndex == 0{
            
            searchTV.allowsMultipleSelection = false
            
        }
        else{
            searchTV.allowsMultipleSelection = true
        }
        
        
    }
    
    func fetchRecipes(searchFor: String) {
        if let url = URL(string: (BASE_URL + searchFor)) {
            
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard data == nil else {
                    if let strData = String(data: data!, encoding: .utf8){
                            
                        do {
                                let recipes = try JSONDecoder().decode(Recipes.self, from: data!)

                                
                                recipes.results.forEach { (r) in
                                
                                self.recipe_List.append(r.title)
                                self.tableData = self.recipe_List
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
    
    @IBAction func addItem(_ sender: UIButton) {
    
        addIngradientAlert()
    }
    
    
    
    func addIngradientAlert(){
        
        let aC = UIAlertController(title: "Add New Ingradient", message: nil, preferredStyle: .alert)
        
        
        aC.addTextField { (nameOfFolder) in
            nameOfFolder.placeholder = "Enter Ingradient Name"
        }
        
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
            let addItem = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let item = aC.textFields![0].text
            var nameTaken: Bool = false
                for ingradient in self.Ingradients_List{
                if item == ingradient { nameTaken = true; break }
            }
            if nameTaken {
                
                self.nameTakenAlert()

            }
            else{
                
                self.Ingradients_List.append(item!)
                self.tableData = self.Ingradients_List
                self.searchTV.reloadData()
            }
            
            
        }
        
         cancel.setValue(UIColor.orange, forKey: "titleTextColor")
         addItem.setValue(UIColor.black, forKey: "titleTextColor")
        
         aC.addAction(cancel)
         aC.addAction(addItem)
         self.present(aC, animated: true, completion: nil)
        
        
    }
    
    func nameTakenAlert(){
        let nameTakenAlert = UIAlertController(title: "Item already added", message: "Please Enter different Ingradient", preferredStyle: .alert)
               
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
            
        })
        nameTakenAlert.addAction(ok)
        ok.setValue(UIColor.orange, forKey: "titleTextColor")
        self.present(nameTakenAlert, animated: true, completion: nil)
        return
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        
        
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
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //IngradientCell
        
        let id = segment_search.selectedSegmentIndex == 0 ? "RecipeCell" : "IngradientCell"
        if let cell = searchTV.dequeueReusableCell(withIdentifier: id){
            
            var data = tableData[indexPath.row]
            
            
            data = data.replacingOccurrences(of: "\n", with: "")
            cell.textLabel?.text = data
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark}
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none}
    }
    
    
}


extension SearchVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        tableData = recipe_List
        searchTV.reloadData()
        
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
