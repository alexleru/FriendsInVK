//
//  Photos.swift
//  FriendsInVK
//
//  Created by alexleru on 27/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import SwiftyJSON

class Photo {
    let photosId: Int
    let url: String
    
    init(_ json: JSON) {
        self.photosId = json["id"].intValue
        self.url = json["sizes"][3]["url"].stringValue
    }
}
