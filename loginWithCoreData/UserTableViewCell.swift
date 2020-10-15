//
//  UserTableViewCell.swift
//  loginWithCoreData
//
//  Created by POORAN SUTHAR on 17/04/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorimage: UIImageView!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var usernamelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
