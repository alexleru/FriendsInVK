//
//  BDService.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 31/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import RealmSwift

class BDService {

    let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    func save(_ object: [Object]) {
        do {
            let realm = try Realm(configuration: config)
            print(realm.configuration.fileURL ?? "default value URL")
            try realm.write {
                    realm.add(object, update: Realm.UpdatePolicy.modified)
            }
        } catch {
            print(error)
        }
    }
}
