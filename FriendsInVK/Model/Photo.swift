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
    @objc dynamic var photosId: Int = 0
    @objc dynamic var url: String = ""
    
//    let photosId: Int
//    let url: String
    
    required convenience init(_ json: JSON) {
        self.init()
        self.photosId = json["id"].intValue
        self.url = json["sizes"][3]["url"].stringValue
    }
}
