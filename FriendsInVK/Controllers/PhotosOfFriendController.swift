//
//  ProfileOfFriendController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class PhotosOfFriendController: UICollectionViewController {

    //MARK - variables
    
    private let networkService = NetworkService();
    private var photos = [Photo]()
    var userId: Int = Session.instance.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadPhotos(for: userId){[weak self] in
            self?.loadDataPhotos(self!.userId)
            self?.collectionView.reloadData()
        }
    }
    
    func loadDataPhotos(_ ownerId: Int){
        do {
            let realm = try Realm()
            let photos = realm.objects(Photo.self).filter("ownerId = %@", ownerId)
            self.photos = Array(photos)
        } catch {
            print(error)
        }
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosOfFriendCell", for: indexPath) as? PhotosOfFriendCell else { fatalError("Problems with PhotoCell")}
        let url = URL(string: photos[indexPath.row].url)
        cell.PhotoImage.kf.setImage(with: url)
        return cell
    }
}
