//
//  ListOfGroupsCell.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 15/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit

class ListOfGroupsCell: UITableViewCell {

    @IBOutlet weak var listOfGroupsNameLabel: UILabel!
    @IBOutlet weak var listOfGroupsDescLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
