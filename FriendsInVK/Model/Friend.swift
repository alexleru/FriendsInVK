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
    
//    let userId: Int
//    let firstName: String
//    let lastName: String
//    let photo: String

    required convenience init(_ json: JSON) {
        self.init()
        self.userId = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo = json["photo_50"].stringValue
    }
}

//{
//                "can_access_closed" = 1;
//                "first_name" = Danynax;
//                id = 11840;
//                "is_closed" = 0;
//                "last_name" = Pox;
//                nickname = "";
//                online = 1;
//                "track_code" = "09b431b6vCUvBFMlzJUNax_UFM4drq53V10j1YCXmx0k20EEvRTRTnYzbnKczwxqGVeAC7jJzg";
//        },
