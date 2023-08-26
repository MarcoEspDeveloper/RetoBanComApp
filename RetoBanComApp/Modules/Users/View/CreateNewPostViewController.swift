//
//  CreateNewPostViewController.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 24/08/23.
//

import UIKit
import MBProgressHUD

class CreateNewPostViewController: UIViewController {

    @IBOutlet weak var mainDialogView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var createPostButton: UIButton!
    
    var presenter: CreateNewPostPresenterProtocol?
    var configurator: CreateNewPostConfiguratorProtocol?
    
    var delegate: UsersViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = CreateNewPostConfigurator()
        configurator?.configure(viewController: self)
        
        self.setupView()
    }

}

extension CreateNewPostViewController {
    
    func setupView() {
        
        mainDialogView.layer.cornerRadius = 24
        
        titleView.layer.cornerRadius = 4
        titleView.layer.borderColor = UIColor.lightGray.cgColor
        titleView.layer.borderWidth = 1
        
        descriptionView.layer.cornerRadius = 4
        descriptionView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionView.layer.borderWidth = 1
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewTap)))
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleViewTap() {
        
        view.endEditing(true)
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        
        self.presenter?.goToBack()
    }
    
    @IBAction func tapCreatePostButton(_ sender: Any) {
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.presenter?.createNewPost(userId: 1, postTitle: self.titleTextField.text ?? "", postDescription: descriptionTextField.text ?? "")
    }
}

extension CreateNewPostViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        
        return false
    }
}

extension CreateNewPostViewController: CreateNewPostViewProtocol {
    
    func showNewPostToBack(userPost: UserPostResponse) {
        
        self.delegate?.callGetNewCreatedPost(userPost: userPost)
        self.presenter?.goToBack()
    }
    
    func showBasicAlert(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
