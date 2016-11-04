//
//  BookWireframe.swift
//  
//
//  Created by  on 27/10/16.
//
//

import Foundation
import UIKit

class BookWireframe: NSObject
{
    var presenter: BookPresenter?
    var bookViewController: BookViewController?

    func presentBookViewFromViewContrller(_ viewController:UIViewController, pageNo:Int){
        bookViewController = bookViewControllerFromStoryboard()
        bookViewController?.selectedPage = pageNo
        bookViewController?.eventHandler = presenter
        viewController.navigationController?.pushViewController(bookViewController!, animated: true)
    }
    
    fileprivate func bookViewControllerFromStoryboard() -> BookViewController {
        let storyboard = mainStoryboard()
        let bookViewController: BookViewController = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifier.Book) as! BookViewController
        return bookViewController
    }
    
    fileprivate func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard
    }

}
