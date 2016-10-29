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
            let path = NSBundle.mainBundle().pathForResource(IndexConstant.CSVFile, ofType: "csv")
            csv = try CSV(name: path!)
            return IndexEntity(csv: csv!)
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
        let defaults = NSUserDefaults.standardUserDefaults()
        if let favoritesDefaults = defaults.objectForKey("favorites") as? IndexEntity  {
            favorites = favoritesDefaults
        }else{
            favorites =  IndexEntity()
        }
        return favorites!
    }
    
    func saveFavoritetem(indexItem:IndexItem){
        if favorites == nil{
            loadFavorites()
        }
        favorites?.itemes.append(indexItem)
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(favorites, forKey: "favorites")
//        defaults.synchronize()
    }
}
