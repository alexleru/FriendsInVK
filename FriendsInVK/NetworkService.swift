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
    //https://api.vk.com/method/friends.get?v=5.101&fields=city,nickname&access_token=
    //MARK: - constant
    let baseUrl = "https://api.vk.com"
    let path = "/method"
    let token = Session.instance.token
    let version = 5.101
    
    //MARK: - func
    func loadFriends(){
        let addpath = "/friends.get"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "fields":"nickname"
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++FRIENDS+++++++++")
            print(response)
        }
    }
    func loadGroups(){
        let addpath = "/groups.get"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "fields":"name"
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++GROUPS+++++++++")
            print(response)
        }
    }
    func searchGrpups(for search: String){
        let addpath = "/groups.search"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "q":search,
            "type":"group"
        ]
        
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++GROUP_SEARCH+++++++++")
            print(response)
        }
    }
    func loadPhotos(){
        let addpath = "/photos.get"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "owner_id":Session.instance.userId
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++PHOTOS+++++++++")
            print(response)
        }
    }
    
}
