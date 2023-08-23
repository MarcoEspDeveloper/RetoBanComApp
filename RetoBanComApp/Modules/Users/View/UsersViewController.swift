//
//  UsersViewController.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import UIKit
import MBProgressHUD

protocol UsersViewDelegate {
    func callGetUserLists(userId: Int64)
}

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var presenter: UsersPresenterProtocol?
    var configurator: UsersConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = UsersConfigurator()
        configurator?.configure(viewController: self)

        self.setupView()
        
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        self.presenter?.getUsersList()
    }
}

extension UsersViewController {
    
    func setupView() {
        
        if #available(iOS 15.0, *) {
            
            self.usersTableView.sectionHeaderTopPadding = 0
        }
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let usersList = self.presenter?.getUsers() {
            
            return usersList.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var user = self.presenter?.getUsers()[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell") as! UsersTableViewCell
        
        cell.setupCell(delegate: self, userId: user?.id, userName: user?.name)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 48
    }
}

extension UsersViewController: UsersViewProtocol {
    
    func showBasicAlert(title: String?, message: String?) {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showUsersList() {
        
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
        self.usersTableView.reloadData()
    }
    
    func showUserPosts() {
        
    }
}

extension UsersViewController: UsersViewDelegate {
    
    func callGetUserLists(userId: Int64) {
        
        self.presenter?.getUserPostsList(userId: userId)
    }
}
