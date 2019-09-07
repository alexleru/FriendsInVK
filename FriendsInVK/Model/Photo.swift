//
//  Photos.swift
//  FriendsInVK
//
//  Created by alexleru on 27/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Photo: Object {
    @objc dynamic var photoId: Int = 0
    @objc dynamic var ownerId: Int = 0
    @objc dynamic var url: String = ""
    
    required convenience init(_ json: JSON) {
        self.init()
        self.photoId = json["id"].intValue
        self.ownerId = json["owner_id"].intValue
        self.url = json["sizes"][3]["url"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "photoId"
    }
}
