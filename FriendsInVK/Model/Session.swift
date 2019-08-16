//
//  Session.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 15/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation

class Session {
    static let instance = Session()
    private init(){}
    
    var token: String!
    var userId: Int!
}
