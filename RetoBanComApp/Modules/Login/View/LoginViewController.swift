//
//  LoginViewController.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 20/08/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passowrdView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signWithGoogleButton: UIButton!
    
    var isSecurePass = true
    var isRememberEmail = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }

    
}

extension LoginViewController {
    
    func setupView() {
        
        emailView.layer.cornerRadius = 4
        emailView.layer.borderColor = UIColor.lightGray.cgColor
        emailView.layer.borderWidth = 1
        
        passowrdView.layer.cornerRadius = 4
        passowrdView.layer.borderColor = UIColor.lightGray.cgColor
        passowrdView.layer.borderWidth = 1
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewTap)))
        view.isUserInteractionEnabled = true
    }
    
    func showOrHidePass() {
        
        passwordTextField.isSecureTextEntry = !self.isSecurePass
        self.isSecurePass = !self.isSecurePass
    }
    
    @objc func handleViewTap() {
        
        view.endEditing(true)
    }
    
    @IBAction func tapShowOrHidePassButton(_ sender: Any) {
        
        self.showOrHidePass()
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        
        
    }
    
    @IBAction func tapLoginGoogleButton(_ sender: Any) {
        
        
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        
        return false
    }
}

