//
//  CreateNewPostConfigurator.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

class CreateNewPostConfigurator: CreateNewPostConfiguratorProtocol {
    
    func configure(viewController: CreateNewPostViewController) {
        
        viewController.presenter = CreateNewPostPresenter(view: viewController)
    }
}
