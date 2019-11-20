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
    
    var recipe_List = [String]()
    var URL_List = [String]()
    var Ingradients_List = ["onions","garlic","ice","potato","tomato"]//[String]()
    
    var tableData = [String]()
    var selected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTV.allowsMultipleSelection = true
        searchBar.isHidden = true
        search_btn.isHidden = false
        add_Ingradient.isHidden = false
        segment_search.selectedSegmentIndex = 1
        
        start()
    }
    
    func start() {
        searchBar.delegate = self
        tableData = Ingradients_List
        searchTV.reloadData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchTV.allowsMultipleSelection = true
        searchBar.isHidden = true
        search_btn.isHidden = false
        add_Ingradient.isHidden = false
        segment_search.selectedSegmentIndex = 1
        
        start()
    }
    

    //  MARK: Actions
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            
            search_btn.isHidden = true
            add_Ingradient.isHidden = true
            searchBar.isHidden = false
            tableData = recipe_List
             
        }
        else{
            
            search_btn.isHidden = false
            add_Ingradient.isHidden = false
            searchBar.isHidden = true
            tableData = Ingradients_List
            
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

                                
                                recipes.results.forEach { (r) in
                                    var name = r.title.replacingOccurrences(of: "\n", with: "")
                                    name = name.replacingOccurrences(of: "\t", with: "")
                                    name = name.replacingOccurrences(of: "\r", with: "")
                                    
                                    self.recipe_List.append(name)
                                //self.tableData.append(r.title)
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
        
        recipe_List = []
        tableData = []
        var selected_items = "?i="
        segment_search.selectedSegmentIndex = 0
        
        
        
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
            
            self.tableData = self.recipe_List
            
            self.searchTV.reloadData()
            
            }
            
        }
        
        
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if let web = segue.destination as? WebVC{
//            web.d_search = self
//            web.source = "search"
//        }
        
        if let cell_selected = sender as? UITableViewCell{
        
            let selected_row = searchTV.indexPath(for: cell_selected)!.row
            
            for i in recipe_List.indices{
                
                if tableData[selected_row] == recipe_List[i]{
                    selected = i
                    
                }
                
            }
        }
        
        if let recipeTBC = segue.destination as? RecipeTBC{
            recipeTBC.searchVC = self
            recipeTBC.url = URL(string: URL_List[selected])
            recipeTBC.nameOfRecipe = tableData[selected]
        }
    }
    

}

//  TableView delegates & datasource
extension SearchVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = segment_search.selectedSegmentIndex == 0 ? "RecipeCell" : "IngradientCell"
        if let cell = searchTV.dequeueReusableCell(withIdentifier: id){
            
            let data = tableData[indexPath.row]
            
            
            //data = data.replacingOccurrences(of: "\n", with: "")
            cell.textLabel?.text = data
            if segment_search.selectedSegmentIndex == 0{
                cell.accessoryType = .detailButton
                cell.imageView?.image = UIImage(named: "fvt")
                
            }
            else{
                cell.accessoryType = .none
            }
            
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark}
        else{
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "fvt_2")
            
            var isFav = false
            
            for f in fvt.fvt_recepie{
                
                if f == tableData[indexPath.row]{
                    isFav = true
                    break
                }
               
            }
            
            if !isFav{
                
                fvt.fvt_recepie.append(tableData[indexPath.row])
                
                
                for i in recipe_List.indices{
                    if recipe_List[i] == tableData[indexPath.row]{
                        
                        fvt.fvt_URL.append(URL_List[i])
                        
                    }
                }
                
            }
                
            }
            
        }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if segment_search.selectedSegmentIndex == 1{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none}
        else{
            tableView.cellForRow(at: indexPath)?.imageView?.image = UIImage(named: "fvt")
            
            for i in fvt.fvt_recepie.indices{
                
                if (tableData[indexPath.row] == fvt.fvt_recepie[i]){
                    fvt.fvt_recepie.remove(at: i); break}
                
            }
            
            
        }
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
        let navController = UINavigationController(rootViewController: recipeTBC)

        self.navigationController?.present(navController, animated: true, completion: nil)
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
        tableData = recipe_List
        searchTV.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableData = searchText.isEmpty ? recipe_List : recipe_List.filter { (item: String) -> Bool in
                
            
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
            
            searchTV.reloadData()
    }
    
    
}
