//
//  NetworkService.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 19/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService{
    
    func password() {
        AF.request("https://jsonplaceholder.typicode.com/posts/1/comments").responseJSON{response in
            print(response.value!)
        }
    }
}
