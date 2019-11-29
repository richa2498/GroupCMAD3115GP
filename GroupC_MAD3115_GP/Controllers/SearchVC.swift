//
//  SearchVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-18.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit


class SearchVC: UIViewController {

    var url: URL?
    //  MARK: Outlets
    
    @IBOutlet weak var search_btn: UIButton!
    @IBOutlet weak var add_Ingradient: UIButton!
    
    @IBOutlet weak var segment_search: UISegmentedControl!
    @IBOutlet weak var searchTV: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var recipes: Recipes?
    
//    var recipe_List = [String]()
//    var URL_List = [String]()
    var Ingradients_List = [String]()
    
//    var tableData = [String]()
    var selected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchTV.allowsMultipleSelection = true
        searchBar.isHidden = true
        search_btn.isHidden = true
        add_Ingradient.isHidden = false
        segment_search.selectedSegmentIndex = 1
        
        start()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchTV.reloadData()
    }
    
    func start() {
       
        if let ingredients : [String] = UserDefaults.standard.value(forKey: "INGREDIENTS") as? [String]{
                Ingradients_List = ingredients
        }
        searchBar.delegate = self
//        tableData = Ingradients_List
//        searchTV.reloadData()
    }
    
    //  MARK: Actions
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            searchBar.isHidden = false
            search_btn.isHidden = true
            add_Ingradient.isHidden = true
//            tableData = recipe_List
        }
        else{
            searchBar.isHidden = true
            search_btn.isHidden = false
            add_Ingradient.isHidden = false
//            tableData = Ingradients_List
            
        }
        searchTV.reloadData()
    }
   
    func fetchRecipes(searchFor: String) {
        if let url = URL(string: (BASE_URL + searchFor)) {
            print(url)
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard data == nil else {
                    if let _ = String(data: data!, encoding: .utf8){
                            
                        do {
                                let recipes = try JSONDecoder().decode(Recipes.self, from: data!)

                            self.recipes = recipes

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
                for ingradient in self.Ingradients_List {
                if item == ingradient { nameTaken = true; break }
            }
            if nameTaken {
                
                self.nameTakenAlert()

            }
            else{
                self.Ingradients_List.append(item!)
                self.updateIngredients()
//                self.tableData = self.Ingradients_List
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
        
//        recipe_List = []
//        tableData = []
        var selected_items = "?i="
        segment_search.selectedSegmentIndex = 0
        searchBar.text = nil
        
        if let selected_ip = searchTV.indexPathsForSelectedRows{
        for ip in selected_ip{
            
            if ip.row > 0 {selected_items += ","}
            selected_items += Ingradients_List[ip.row]
        }
        
        fetchRecipes(searchFor: selected_items)
        
        let seconds = 1.0 // finding recepies message should be displayed
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            
            self.search_btn.isHidden = true
            self.add_Ingradient.isHidden = true
            self.searchBar.isHidden = false

//            self.tableData = self.recipe_List
            
            self.searchTV.reloadData()
            
            }
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let cell_selected = sender as? UITableViewCell{
        
            let selected_row = searchTV.indexPath(for: cell_selected)!.row
            
            for i in (recipes?.results.indices)!{
                if recipes?.results[selected_row].title == recipes?.results[i].title{
                    selected = i
                }
            }
        }
        
        if let recipeTBC = segue.destination as? RecipeTBC{
            recipeTBC.searchVC = self
            recipeTBC.url = URL(string: (recipes?.results[selected].href)!)
            recipeTBC.nameOfRecipe = recipes?.results[selected].title
        }
        fetchVideos(nameOfRecipe: (recipes?.results[selected].title)!)
    }
    
}

//  TableView delegates & datasource
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (segment_search.selectedSegmentIndex == 0 ? (recipes?.results.count ?? 0) : Ingradients_List.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = segment_search.selectedSegmentIndex == 0 ? "RecipeCell" : "IngradientCell"
        
        if let cell = searchTV.dequeueReusableCell(withIdentifier: id){
           
            //data = data.replacingOccurrences(of: "\n", with: "")
            if segment_search.selectedSegmentIndex == 0{
                let data = recipes?.results[indexPath.row]
                cell.textLabel?.text = data?.title
                cell.accessoryType = .detailButton
                cell.imageView?.image = UIImage(named: "fvt")
            }
            else{
                cell.textLabel?.text = Ingradients_List[indexPath.row]
                cell.accessoryType = .none
            }
        
            return cell
        }
        
        return UITableViewCell()
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            if !tableView.visibleCells.filter({ (c) -> Bool in
                c.accessoryType == UITableViewCell.AccessoryType.checkmark
            }).isEmpty {
                self.search_btn.isHidden = false
            }
            
        }
        else{
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "fvt_2")
            
            var isFav = false
            
            for f in fav_results{
                
                if f.title == (self.recipes?.results[indexPath.row])?.title{
                    isFav = true
                    break
                }
            }
            
            if !isFav{
                
                fav_results.append((recipes?.results[indexPath.row])!)
            }
                
            }
            
        }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath){
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
            if tableView.visibleCells.filter({ (c) -> Bool in
                c.accessoryType == UITableViewCell.AccessoryType.checkmark
            }).isEmpty {
                self.search_btn.isHidden = true
            }
        }
        else{
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "fvt")
            
            for i in fav_results.indices{
                
                if (recipes?.results[indexPath.row].title == fav_results[i].title){
                    fav_results.remove(at: i);
                    break
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete: UIContextualAction = UIContextualAction(style: .destructive, title: "Remove") { (act, v, _) in
            self.Ingradients_List.remove(at: indexPath.row)
            self.updateIngredients()
            self.searchTV.reloadData()
        }
        
        return UISwipeActionsConfiguration.init(actions: (self.segment_search.selectedSegmentIndex == 1 ? [delete] : []))
    }
}
 

//  Searchbar delegates & datasource
extension SearchVC: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTV.reloadData()
        searchBar.resignFirstResponder()
        
        guard let recipeTBC: RecipeTBC = self.storyboard?.instantiateViewController(withIdentifier: "RecipeTBC") as? RecipeTBC else { return }
        self.fetchRecipeByName(searchFor: "?i=&q=\(searchBar.text!)")
        recipeTBC.nameOfRecipe = searchBar.text
        recipeTBC.url = self.url

//        self.navigationController?.pushViewController(recipeTBC, animated: true)
        
        searchTV.reloadData()
    }
    
    func fetchRecipeByName(searchFor: String) {
        if let url = URL(string: (BASE_URL + searchFor)) {
            print(url)
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                guard data == nil else {
                    if let _ = String(data: data!, encoding: .utf8){
                            
                        do {
                                let recipes = try JSONDecoder().decode(Recipes.self, from: data!)

                            self.url = URL(string: recipes.results.first!.href)
                            print("recipeTBC: \(url)")
                            } catch{
                    
                                print(error)
                            }
                    }
                    return
                }
            }.resume()
        }
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        recipes = nil
        searchTV.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty{
            searchItem(str: searchText)
        }
    }
    
    func searchItem(str : String) {
        if var rec = self.recipes {
            let results: [Result] = (str.isEmpty ? rec.results : recipes?.results.filter({ (res) -> Bool in
                    res.title.lowercased(with: .current).contains(str.lowercased())
                }))!
            rec.results = results
            self.recipes = rec
            fetchVideos(nameOfRecipe: str)
        
            searchTV.reloadData()
        }
    }
    
    func updateIngredients(){
        UserDefaults.standard.set(Ingradients_List, forKey: "INGREDIENTS")
    }
}

/*
override func viewDidAppear(_ animated: Bool) {
    searchTV.allowsMultipleSelection = true
    searchBar.isHidden = true
    search_btn.isHidden = false
    add_Ingradient.isHidden = false
    segment_search.selectedSegmentIndex = 1
    
    start()
 }

 */
