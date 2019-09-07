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
    var userId: Int = Session.instance.userId
    private var photos: Results<Photo>? = nil
    private var token: NotificationToken? = nil
    private let networkService = NetworkService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadPhotos(for: userId)
        loadDataPhotos(userId)
    }
    
    func loadDataPhotos(_ ownerId: Int){
        let realm = try? Realm()
        photos = realm?.objects(Photo.self).filter("ownerId = %@", ownerId)
        token = (photos!.observe{ [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = self?.collectionView else {return}
            switch changes {
            case .initial:
                collectionView.reloadData()
            case .update(_, let deletions, let insertions, let modification):
                collectionView.performBatchUpdates({
                    collectionView.deleteItems(at: deletions.map({IndexPath(row: $0, section: 0)}))
                collectionView.insertItems(at: insertions.map({IndexPath(row: $0, section: 0)}))
                collectionView.reloadItems(at: modification.map({IndexPath(row: $0, section: 0)}))
                }, completion: nil)
            case .error(let error):
                print(error)
            }
            
        })
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosOfFriendCell", for: indexPath) as? PhotosOfFriendCell else { fatalError("Problems with PhotoCell")}
        let url = URL(string: photos![indexPath.row].url)
        cell.PhotoImage.kf.setImage(with: url)
        return cell
    }
}
