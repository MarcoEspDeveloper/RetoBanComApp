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
    func callGetNewCreatedPost(userPost: UserPostResponse)
}

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    var presenter: UsersPresenterProtocol?
    var configurator: UsersConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configurator = UsersConfigurator()
        configurator?.configure(viewController: self, delegate: self)

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
    
    @IBAction func createNewPost(_ sender: Any) {
        
        self.presenter?.goToCreateNewPost(delegate: self)
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
        
        let user = self.presenter?.getUsers()[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell") as! UsersTableViewCell
        
        cell.setupCell(delegate: self, userId: user?.id, userName: user?.name)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let user = self.presenter?.getUsers()[section], let isExpanded = user.isExpanded, isExpanded {
            
            return user.userPosts?.count ?? 0
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let isExpanded = self.presenter?.getUsers()[indexPath.section].isExpanded, isExpanded, let post = self.presenter?.getUsers()[indexPath.section].userPosts?[indexPath.row] {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserPostTableViewCell", for: indexPath) as! UserPostTableViewCell
            cell.setupCell(postTitle: post.title, postDescription: post.body)
            cell.selectionStyle = .none
            
            return cell
        } else {
            
            return UITableViewCell(frame: .zero)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 48
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 131
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
    
    func showUserPosts(userId: Int64) {
        
        self.presenter?.setUserSelection(userId: userId)
        self.usersTableView.reloadData()
    }
    
    func showNewUserPost() {
        
        self.usersTableView.reloadData()
    }
}

extension UsersViewController: UsersViewDelegate {
    
    func callGetUserLists(userId: Int64) {
        
        self.presenter?.getUserPostsIfEmpty(userId: userId)
    }
    
    func callGetNewCreatedPost(userPost: UserPostResponse) {
        
        self.presenter?.setNewPost(userPost: userPost)
    }
}
