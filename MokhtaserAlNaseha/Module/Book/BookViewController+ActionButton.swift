//
//  BookViewController+ActionButton.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/22/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton

extension BookViewController: LiquidFloatingActionButtonDataSource, LiquidFloatingActionButtonDelegate {
    
    func setupActionButton(){
        let createButton: (CGRect, LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton = { (frame, style) in
            let floatingActionButton = CustomDrawingActionButton(frame: frame)
            floatingActionButton.animateStyle = style
            floatingActionButton.dataSource = self
            floatingActionButton.delegate = self
            return floatingActionButton
        }
        
        let cellFactory: (String) -> LiquidFloatingCell = { (iconName) in
            let cell = LiquidFloatingCell(icon: UIImage(named: iconName)!)
            return cell
        }

        cells = []
        cells.append(cellFactory("favorite"))
        cells.append(cellFactory("sound"))
        
        let floatingFrame = CGRect(x: self.view.frame.width - 56 - 16, y: self.view.frame.height - 56 - 16 - 45, width: 56, height: 56)
        let bottomRightButton = createButton(floatingFrame, .Up)
        
//        let image = UIImage(named: "Plus-50")
//        bottomRightButton.image = image
        self.view.addSubview(bottomRightButton)
    }
    
    func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
        return cells.count
    }
    
    func cellForIndex(index: Int) -> LiquidFloatingCell {
        return cells[index]
    }
}
