//
//  UserCell.swift
//  DataxChat
//
//  Created by Nguyễn Xuân Đạt on 2/18/17.
//  Copyright © 2017 Nguyễn Xuân Đạt. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func updateUI(user: User) {
        firstNameLabel.text = user.firstName
    }
    
    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked2" : "messageindicator2"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }


}
