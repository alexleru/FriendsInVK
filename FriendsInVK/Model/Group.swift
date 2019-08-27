//
//  Group.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON

class Group {
    let name: String
    let description: String
    
    init(_ json: JSON) {
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
    }
}
