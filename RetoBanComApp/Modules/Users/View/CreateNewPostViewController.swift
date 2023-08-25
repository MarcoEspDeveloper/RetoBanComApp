//
//  CreateNewPostViewController.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 24/08/23.
//

import UIKit

class CreateNewPostViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var createPostButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

}

extension CreateNewPostViewController {
    
    func setupView() {
        
        titleTextField.layer.cornerRadius = 4
        titleTextField.layer.borderColor = UIColor.lightGray.cgColor
        titleTextField.layer.borderWidth = 1
        
        descriptionTextField.layer.cornerRadius = 4
        descriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextField.layer.borderWidth = 1
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewTap)))
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleViewTap() {
        
        view.endEditing(true)
    }
    
    @IBAction func tapCloseButton(_ sender: Any) {
        
        
    }
    
    @IBAction func tapCreatePostButton(_ sender: Any) {
        
        
    }
}

extension CreateNewPostViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        
        return false
    }
}
