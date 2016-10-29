//
//  BookInteractor.swift
//  
//
//  Created by  on 27/10/16.
//
//

import Foundation

class BookInteractor: NSObject
{
    weak var presenter: BookPresenter?
    var dataManager: BookDataManager?
}
