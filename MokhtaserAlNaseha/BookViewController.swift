//
//  BookViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/20/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit
import M13PDFKit

class BookViewController: PDFKBasicPDFViewer {
    
    private var pdfDocument: PDFKDocument?
    private var selectedPage:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pdfPath = NSBundle.mainBundle().pathForResource("mokhtaser", ofType:"pdf") else{
            return
        }
        previewBook(pdfPath)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        self.displayPage(UInt(selectedPage))
    }
    func previewBook(path:String){
        self.pdfDocument = PDFKDocument(contentsOfFile: path, password: nil)
        self.loadDocument(pdfDocument)
        self.enableSharing = false
        self.enablePrinting = false
        self.enableOpening = false
        self.enableBookmarks = false
    }
    
    func selectPageNumber(no:Int){
        selectedPage = no
    }
    
}

