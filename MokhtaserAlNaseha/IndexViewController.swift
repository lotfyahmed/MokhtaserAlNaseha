//
//  IndexViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/20/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

class IndexViewController: UICollectionViewController {
    
    private let reuseIdentifier = "IndexCell"
    private let addImageIcon = "addImage"
    private var indexEntity:IndexEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الفهرس"
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "IndexCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        self.indexEntity = FileManager.sharedInstance.loadIndex()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexEntity.titles.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! IndexCell
        cell.button.tag = indexPath.row
        
        // Configure the cell
        cell.icon.image = UIImage(named:indexEntity.imageNames[indexPath.row])
        cell.textLabel?.text = indexEntity.titles[indexPath.row]
        cell.button?.addTarget(self, action: #selector(IndexViewController.indexButtonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    // TODO: Refactor this part using Wireframe and presenter
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let length = (UIScreen.mainScreen().bounds.width - 20)/3
        return CGSizeMake(length,length);
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        
    }
    
    var indexNo = 0
    func indexButtonAction(sender:UIButton){
        let row = sender.tag
        print(indexEntity.pageNumbers[row])
        indexNo = indexEntity.pageNumbers[row]
        let bookViewController = bookViewControllerFromStoryboard()        
        bookViewController.selectPageNumber(indexEntity.pageNumbers[row])
        self.navigationController?.pushViewController(bookViewController, animated: true)
    }
    
    func bookViewControllerFromStoryboard() -> BookViewController {
        let storyboard = mainStoryboard()
        let bookViewController: BookViewController = storyboard.instantiateViewControllerWithIdentifier("BookViewController") as! BookViewController
        return bookViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
    
}

