//
//  FavoriteTableViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/23/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    var favorites:IndexEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "المفضل"
        favorites = FileManager.sharedInstance.loadFavorites()
    }
    
    func addFavoritePage(_ page:Int){
//        favorites.pageNumbers.append(page)
//        favorites.titles.append("Title page \(page) ")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (favorites?.itemes.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        
        let item = favorites?.itemes[indexPath.row]
        cell.textLabel?.text = item?.description()
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookvewController = segue.destination as? BookViewController {
            let item = favorites?.itemes[(tableView.indexPathForSelectedRow?.row)!]
            bookvewController.selectPageNumber( Int((item?.pageNumber)!))
        }
    }
}
