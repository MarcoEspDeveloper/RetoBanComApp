//
//  UsersTableViewCell.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 22/08/23.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var actionView: UIView!
    
    var delegate: UsersViewDelegate?
    
    var userId: Int64 = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupAction()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UsersTableViewCell {
    
    func setupAction() {
        
        self.actionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToGetUserPostsList)))
    }
    
    @objc func goToGetUserPostsList() {
        
        self.delegate?.callGetUserLists(userId: self.userId)
    }
    
    func setupCell(delegate: UsersViewDelegate?, userId: Int64?, userName: String?) {
        
        self.delegate = delegate
        self.userId = userId ?? -1
        self.userNameLabel.text = userName ?? ""
    }
}
