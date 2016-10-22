//
//  BookViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/20/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit
import M13PDFKit
import LiquidFloatingActionButton

class BookViewController: PDFKBasicPDFViewer{
    
    internal var pdfDocument: PDFKDocument?
    private var selectedPage:Int = 1
    private var favorites:[UInt] = []
    internal var cells: [LiquidFloatingCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "كتاب مختصر النصيحة"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        self.displayPage(UInt(selectedPage))
        self.enableThumbnailSlider = false
        self.enableSharing = false
        self.enablePrinting = false
        self.enableOpening = false
        self.enableBookmarks = false
        self.enablePreview = false
        self.setupActionButton()
    }
    
    func previewBook(path:String){
        self.pdfDocument = PDFKDocument(contentsOfFile: path, password: nil)
        self.loadDocument(pdfDocument)
    }
    
    func selectPageNumber(no:Int){
        selectedPage = no
        guard let pdfPath = NSBundle.mainBundle().pathForResource("Nasyha", ofType:"pdf") else{
            return
        }
        previewBook(pdfPath)
    }
    
    func addFavoriteAction() {
        favorites.append(pdfDocument!.currentPage)
        print ("favorite \(pdfDocument!.currentPage)")
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

