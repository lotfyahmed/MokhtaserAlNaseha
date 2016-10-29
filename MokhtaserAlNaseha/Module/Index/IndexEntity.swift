//
//  IndexEntity.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/21/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import Foundation
import SwiftCSV

class IndexEntity {
    var itemes:[IndexItem] = []
    var titles:[String] = []
    var pageNumbers:[Int] = []
    var imageNames:[String] = ["Morning_100", "evening_100", "illnes", "Clothes1-96", "Clothes2-96", "Sleeping_100",
        "Morning", "Sunset-100", "Sleeping in Bed-100", "Trousers-96", "azkar", "azkar",
        "Morning_100", "evening_100", "illnes", "Clothes1-96", "Clothes2-96", "Sleeping_100",
        "Morning", "Sunset-100", "Sleeping in Bed-100", "Trousers-96", "azkar", "azkar",             "azkar", "azkar", "azkar", "azkar", "azkar", "azkar",
        "azkar", "azkar", "azkar", "azkar", "azkar", "azkar",
        "azkar", "azkar", "azkar", "azkar", "azkar", "azkar",
        "azkar", "azkar", "azkar", "azkar", "azkar", "azkar",
        "azkar", "azkar", "azkar", "azkar", "azkar", "azkar",
        "azkar", "azkar", "azkar", "azkar", "azkar", "azkar"
    ]
    
    init(csv:CSV){
        let columnes = csv.columns
        if let indexTitles = columnes[IndexConstant.Index]{
            titles = indexTitles
        }
        
        if let page = columnes[IndexConstant.PageNumber]{
            pageNumbers = page.map({Int($0)! - IndexConstant.UnusedPages})
        }
        
        for i in 0..<titles.count {
            let item = IndexItem(title: titles[i], pageNumber: UInt(pageNumbers[i]), imageName:imageNames[i])
            self.itemes.append(item)
        }
    }
    
    init(){
        titles = []
        pageNumbers = []
        imageNames = []
    }
}

struct IndexItem {
    var title:String
    var pageNumber:UInt
    var imageName:String
    
    func description ()->String{
            return "\(self.title) Page \(self.pageNumber)"
    }
    
}