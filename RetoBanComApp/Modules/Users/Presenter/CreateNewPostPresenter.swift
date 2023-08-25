//
//  CreateNewPostPresenter.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 25/08/23.
//

import Foundation

class CreateNewPostPresenter: CreateNewPostPresenterProtocol {
    
    weak var createNewPostView: CreateNewPostViewProtocol!
    var interactor: CreateNewPostInteractorProtocol?
    var router: CreateNewPostRouterProtocol?
    
    var usersList: [UserResponse] = []
    
    init(view: CreateNewPostViewProtocol) {
        self.createNewPostView = view
        self.interactor = CreateNewPostInteractor(presenter: self)
        self.router = CreateNewPostRouter(withView: self.createNewPostView)
    }
    
    func createNewPost(userId: Int64, postTitle: String, postDescription: String) {
        
        self.interactor?.postCreateNewPost(userId: userId, postTitle: postTitle, postDescription: postDescription)
    }
    
    func didGetCreatePost(userPost: UserPostResponse) {
        
        self.createNewPostView.showNewPostToBack(userPost: userPost)
    }
    
    func failGetCreatePost(error: NSError) {
        
        self.createNewPostView.showBasicAlert(title: "Error", message: error.localizedDescription)
    }
    
    func goToBack() {
        
        self.router?.goToBack(originViewController: createNewPostView as! CreateNewPostViewController)
    }
}
