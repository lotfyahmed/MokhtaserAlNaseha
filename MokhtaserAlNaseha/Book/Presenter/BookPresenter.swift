//
//  BookPresenter.swift
//  
//
//  Created by  on 27/10/16.
//
//

import Foundation

class BookPresenter: NSObject, BookModuleInterface
{
    var interactor: BookInteractor?
    var wireframe: BookWireframe?
    var userInterface: BookViewInterface?

    // MARK: - BookModuleInterface methods
    // implement module interface here
}
