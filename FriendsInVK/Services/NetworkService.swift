//
//  NetworkService.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 19/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkService{
    //MARK: - constant
    let baseUrl = "https://api.vk.com"
    let path = "/method"
    let token = Session.instance.token
    let version = 5.101
    
    //MARK: - func
    func loadFriends(completion: @escaping () -> Void){
        let addpath = "/friends.get"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "order":"name",
            "fields":"nickname, photo_50"
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            //print("+++++++++++++FRIENDS+++++++++")
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let friendsJSON = json["response"]["items"].arrayValue
                let friends = friendsJSON.map { Friend($0)}.filter(){$0.firstName != "DELETED"}
                BDService().save(friends)
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
    func loadGroups(completion: @escaping () -> Void){
        let addpath = "/groups.get"
        let parameters: Parameters = [
            "access_token":token,
            "extended":1,
            "v":version,
            "fields":"description"
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++GROUPS+++++++++")
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let groupJSON = json["response"]["items"].arrayValue
                let groups = groupJSON.map { Group($0)}
                BDService().save(groups)
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
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
    func loadPhotos(for userId: Int, completion: @escaping () -> Void){
        let addpath = "/photos.getAll"
        let parameters: Parameters = [
            "access_token":token,
            "v":version,
            "owner_id":userId
        ]
        AF.request(baseUrl+path+addpath, method: .get, parameters: parameters).responseJSON{response in
            print("+++++++++++++PHOTOS+++++++++")
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let photosJSON = json["response"]["items"].arrayValue
                let photos = photosJSON.map { Photo($0)}
                BDService().save(photos)
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
    
}
