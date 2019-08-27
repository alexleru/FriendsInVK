//
//  ProfileOfFriendController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import Kingfisher



class PhotosOfFriendController: UICollectionViewController {

    //MARK - variables
    
    private let networkService = NetworkService();
    private var photos = [Photo]()
    var userId: Int = Session.instance.userId
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        networkService.loadPhotos(for: userId){[weak self] photos in
            self?.photos = photos
            self?.collectionView.reloadData()
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
