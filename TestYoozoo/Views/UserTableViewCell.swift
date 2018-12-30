//
//  UserTableViewCell.swift
//  TestYoozoo
//
//  Created by Bhavesh on 30/12/18.
//  Copyright © 2018 Bhavesh. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var userImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
