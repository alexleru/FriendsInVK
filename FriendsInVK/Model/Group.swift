//
//  Group.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Group: Object {
    @objc dynamic var groupId: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var descriptions: String = ""
    
    //let groupId: Int
    //let name: String
    //let description: String
    
    required convenience init(_ json: JSON) {
        self.init()
        self.groupId = json["id"].intValue
        self.name = json["name"].stringValue
        self.descriptions = json["description"].stringValue
    }
}
