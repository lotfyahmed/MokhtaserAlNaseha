//
//  IndexViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/20/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

class IndexViewController: UICollectionViewController {
    
    fileprivate let reuseIdentifier = "IndexCell"
    fileprivate let addImageIcon = "addImage"
    fileprivate var indexEntity:IndexEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "الفهرس"
        // Register cell classes
        self.collectionView!.register(UINib(nibName: "IndexCell", bundle: nil), forCellWithReuseIdentifier:reuseIdentifier)
        self.indexEntity = FileManager.sharedInstance.loadIndex()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexEntity.titles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IndexCell
        cell.button.tag = indexPath.row
        
        // Configure the cell
        cell.icon.image = UIImage(named:indexEntity.imageNames[indexPath.row])
        cell.textLabel?.text = indexEntity.titles[indexPath.row]
        cell.button?.addTarget(self, action: #selector(IndexViewController.indexButtonAction(_:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    // TODO: Refactor this part using Wireframe and presenter
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize{
        let length = (UIScreen.main.bounds.width - 20)/3
        return CGSize(width: length,height: length);
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
    }
    
    var indexNo = 0
    func indexButtonAction(_ sender:UIButton){
        let row = sender.tag
        print(indexEntity.pageNumbers[row])
        indexNo = indexEntity.pageNumbers[row]
        let bookViewController = bookViewControllerFromStoryboard()        
        bookViewController.selectPageNumber(indexEntity.pageNumbers[row])
        self.navigationController?.pushViewController(bookViewController, animated: true)
    }
    
    func bookViewControllerFromStoryboard() -> BookViewController {
        let storyboard = mainStoryboard()
        let bookViewController: BookViewController = storyboard.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        return bookViewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }
    
}

