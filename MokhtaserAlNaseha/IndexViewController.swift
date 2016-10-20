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
    private var indexTitles:[String] = []
    private var indexNumber:[Int] =   Index.IndexNumberes
    private var imagesNames:[String] = Index.ImagesNames
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الفهرس"
        // Register cell classes
        self.collectionView!.registerNib(UINib(nibName: "IndexCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        loadIndexDictionary()
    }
    
    func loadIndexDictionary(){
        do {
            if let path = NSBundle.mainBundle().pathForResource("IndexInfo", ofType: "txt"){
                let data = try String(contentsOfFile:path)
                indexTitles = data.componentsSeparatedByString("\r\n")
                print(indexTitles)
            }
        } catch let err as NSError {
            // do something with Error
            print(err)
        }
    }
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexTitles.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! IndexCell
        cell.button.tag = indexPath.row
        
        // Configure the cell
        cell.icon.image = UIImage(named:imagesNames[indexPath.row])
        cell.textLabel?.text = indexTitles[indexPath.row]
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
        print(indexNumber[row])
        indexNo = indexNumber[row]
        let bookViewController = bookViewControllerFromStoryboard()        
        bookViewController.selectPageNumber(indexNumber[row])
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

