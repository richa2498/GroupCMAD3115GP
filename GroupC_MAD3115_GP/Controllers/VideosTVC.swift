//
//  VideosTVC.swift
//  GroupC_MAD3115_GP
//
//  Created by Rudrik Panchal on 2019-11-20.
//  Copyright © 2019 Make My Dish. All rights reserved.
//

import UIKit

class VideosTVC: UITableViewController {

    var searchVC: SearchVC?
    var selectedItem: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    func start() {
        if let video = yt_Videos{

        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (yt_Videos?.items.count ?? 0)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") {
            cell.textLabel?.text = yt_Videos?.items[indexPath.row].snippet.title
            
            DispatchQueue.global(qos: .userInitiated).async {
                do{
                    let imageData: Data = try Data(contentsOf: URL(string: (yt_Videos?.items[indexPath.row].snippet.thumbnails.high.url)!)!)

                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData)
                        cell.imageView?.image = image
//                        cell.imageView!.sizeToFit()
                    }
                }catch{
                    print("Unable to load data: \(error)")
                }
            }
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell{
            selectedItem = tableView.indexPath(for: cell)!.row
        }
        if let playerVC = segue.destination as? PlayerVC{
            if let item: Item = yt_Videos?.items[selectedItem]{
                playerVC.item = item
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

}
