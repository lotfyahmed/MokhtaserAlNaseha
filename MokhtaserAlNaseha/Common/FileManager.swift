//
//  FileManager.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/21/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit
import SwiftCSV

class FileManager{
    
    static let sharedInstance = FileManager()
    var favorites:IndexEntity?
    var mainIndex:IndexEntity?
    var detailedIndex:IndexEntity?
    
    func loadIndex()->IndexEntity?{
        let csv:CSV?
        do {
            let path = Bundle.main.path(forResource: IndexConstant.CSVFile, ofType: "csv")
            csv = try CSV(name: path!)
            self.mainIndex = IndexEntity(csv: csv!)
            return self.mainIndex!
        } catch {
            // Catch errors or something
            print("CSV Catch errors or something")
            return nil
        }
    }
    
    //MARK: -
    func loadFavorites() -> IndexEntity{
        if favorites != nil{
            return favorites!
        }
        let defaults = UserDefaults.standard
        if let favoritesDefaults = defaults.object(forKey: "favorites") as? IndexEntity  {
            favorites = favoritesDefaults
        }else{
            favorites =  IndexEntity()
        }
        return favorites!
    }
    
    func saveFavoritetem(_ indexItem:IndexItem){
        if favorites == nil{
            loadFavorites()
        }
        guard let selectediIem = mainIndex?.itemes.filter({ (item) -> Bool in
            item.pageNumber == indexItem.pageNumber
        }) else{
            favorites?.itemes.append(indexItem)
            return
        }
        favorites?.itemes.append(contentsOf: selectediIem)
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(favorites, forKey: "favorites")
//        defaults.synchronize()
    }
}
