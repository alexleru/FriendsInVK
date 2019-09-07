//
//  Friend.swift
//  FriendsInVK
//
//  Created by alexleru on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Friend: Object {
    @objc dynamic var userId: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo: String = ""

    required convenience init(_ json: JSON) {
        self.init()
        self.userId = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo = json["photo_50"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
