//
//  ListOfFriendsController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift


class ListOfFriendsController: UITableViewController {

    //MARK: - constants
    private var friends: Results<Friend>? = nil
    private var token: NotificationToken? = nil
    private let networkService = NetworkService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadFriends()
        loadDataFriends()
    }
    
    func loadDataFriends(){
        let realm = try? Realm()
        friends = realm?.objects(Friend.self)
        token = (friends!.observe{ [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else {return}
            switch changes {
            case .initial:
                tableView.reloadData()
            case .update(_, let deletions, let insertions, let modification):
                tableView.beginUpdates()
                tableView.deleteRows(at: deletions.map({IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.insertRows(at: insertions.map({IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.reloadRows(at: modification.map({IndexPath(row: $0, section: 0)}), with: .automatic)
                tableView.endUpdates()
            case .error(let error):
                print(error)
            }
            
            })
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfFriendsCell", for: indexPath) as? ListOfFriendsCell else {fatalError("Problem with ListOfFriendsCell")}
        let friend = friends![indexPath.row]
        cell.listOfFriendsLabel.text = ("\(friend.firstName) \(friend.lastName)")
        let url = URL(string: friend.photo)
        cell.listOfFriendsImage.kf.setImage(with: url)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoShowSegue",
        let destinationVC = segue.destination as? PhotosOfFriendController,
            let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.userId = friends![indexPath.row].userId
        }
    }
}
