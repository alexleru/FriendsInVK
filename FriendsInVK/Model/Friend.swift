//
//  Friend.swift
//  FriendsInVK
//
//  Created by alexleru on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON

class Friend {
    let firstName: String
    let lastName: String
    let photo: String
    init(_ json: JSON) {
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
