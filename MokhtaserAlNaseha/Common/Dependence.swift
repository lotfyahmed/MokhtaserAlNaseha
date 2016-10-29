//
//  Dependence.swift
//  MokhtaserAlNaseha
//
//  Created by Ahmed Lotfy on 10/27/16.
//  Copyright © 2016 Ahmed Lotfy. All rights reserved.
//

import UIKit

class Dependence{

    let bookWireframe = BookWireframe()
    let bookPresenter = BookPresenter()
    
    func setup(){
        bookWireframe.presenter = bookPresenter
        bookPresenter.wireframe = bookWireframe
    }
}
