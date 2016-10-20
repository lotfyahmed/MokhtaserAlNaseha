//
//  FirstViewController.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/20/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit
import M13PDFKit

class FirstViewController: PDFKBasicPDFViewer {
    
     override func viewDidLoad() {
        super.viewDidLoad()
        guard let pdfPath = NSBundle.mainBundle().pathForResource("mokhtaser", ofType:"pdf") else{
            return
        }
        previewBook(pdfPath)
    }

    func previewBook(path:String){
        //Create the document for the viewer when the segue is performed.
        //var viewer: PDFKBasicPDFViewer = segue.destinationViewController as PDFKBasicPDFViewer
        
        //Load the document (pdfUrl represents the path on the phone of the pdf document you wish to load)
        let document: PDFKDocument = PDFKDocument(contentsOfFile: path, password: nil)
        self.loadDocument(document)
    }


}

