//
//  UserPostTableViewCell.swift
//  RetoBanComApp
//
//  Created by Marco Antonio  on 24/08/23.
//

import UIKit

class UserPostTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UserPostTableViewCell {
    
    func setupCell(postTitle: String?, postDescription: String?) {
        
        self.postTitleLabel.text = postTitle ?? ""
        self.postDescriptionLabel.text = postDescription ?? ""
    }
}
