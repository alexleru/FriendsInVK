//
//  ListOfFriendsCell.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 15/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit

class ListOfFriendsCell: UITableViewCell {
    
    @IBOutlet weak var listOfFriendsLabel: UILabel!
    @IBOutlet weak var listOfFriendsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
