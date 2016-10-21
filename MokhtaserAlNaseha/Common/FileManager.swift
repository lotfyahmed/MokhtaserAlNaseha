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
    
}
