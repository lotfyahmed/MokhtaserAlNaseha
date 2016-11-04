//
//  BookViewController.swift
//
//
//  Created by  on 27/10/16.
//
//

import UIKit
import M13PDFKit
import LiquidFloatingActionButton

class BookViewController: PDFKBasicPDFViewer, BookViewInterface{
    var eventHandler: BookModuleInterface?
    internal var pdfDocument: PDFKDocument?
    var selectedPage:Int = 1
    internal var cells: [LiquidFloatingCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "كتاب مختصر النصيحة"
        self.tabBarController?.tabBar.isHidden = true
        
        let favoriteItem = UIBarButtonItem(image: UIImage(named: "favorite"), style: .plain, target: self, action: #selector(BookViewController.addFavoriteAction))
        self.navigationItem.rightBarButtonItem = favoriteItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.displayPage(UInt(selectedPage))
        //self.setupActionButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func previewBook(_ path:String){
        self.pdfDocument = PDFKDocument(contentsOfFile: path, password: nil)
        self.loadDocument(pdfDocument)
    }
    
    func selectPageNumber(_ no:Int){
        selectedPage = no
        guard let pdfPath = Bundle.main.path(forResource: "Nasyha", ofType:"pdf") else{
            return
        }
        previewBook(pdfPath)
    }
    
    func addFavoriteAction(_ sender:UIButton) {
        let item = IndexItem(title: "", pageNumber: pdfDocument!.currentPage, imageName: "")
        FileManager.sharedInstance.saveFavoritetem(item)
    }

    var count = 0
    func counterAction() {
        count += 1
        print(count)
    }
    
    func playSoundForPage(){
        print ("sound \(pdfDocument!.currentPage)")
    }
}


