//
//  UsersViewController.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
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
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell") as! UsersTableViewCell
        
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
