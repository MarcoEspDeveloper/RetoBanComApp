//
//  UsersRouter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import Foundation
import UIKit

class UsersRouter {
    
    private weak var usersViewProtocol: UsersViewProtocol!
    
    init(withView view: UsersViewProtocol) {
        self.usersViewProtocol = view
    }
}

extension UsersRouter: UsersRouterProtocol {
    
    func goToCreateNewPost(originViewController: UsersViewController, delegate: UsersViewDelegate) {
        
        let storyboard = UIStoryboard(name: "Users", bundle: nil)
        let destinyViewController = storyboard.instantiateViewController(withIdentifier: "CreateNewPostViewController") as! CreateNewPostViewController
        destinyViewController.delegate = delegate
        
        originViewController.navigationController?.present(destinyViewController, animated: false)
    }
}
