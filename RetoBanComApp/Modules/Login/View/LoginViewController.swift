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
    
    var presenter: LoginPresenterProtocol?
    var configurator: LoginConfiguratorProtocol?
    
    var isSecurePass = true
    var isRememberEmail = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = LoginConfigurator()
        configurator?.configure(viewController: self)
        
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
        
        self.presenter?.goToValidateUser(userName: self.emailTextField.text ?? "", userPassword: self.passwordTextField.text ?? "")
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

extension LoginViewController: LoginViewProtocol {
    
    func showBasicAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

