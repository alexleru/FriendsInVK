//
//  ListOfFriendsController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import Kingfisher

class ListOfFriendsController: UITableViewController {

    //MARK: - constants
    private let networkService = NetworkService();
    private var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadFriends() {[weak self] friends in
            self?.friends = friends
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfFriendsCell", for: indexPath) as? ListOfFriendsCell else {fatalError("Problem with ListOfFriendsCell")}

        cell.listOfFriendsLabel.text = ("\(friends[indexPath.row].firstName) \(friends[indexPath.row].lastName)")
        let url = URL(string: friends[indexPath.row].photo)
        cell.listOfFriendsImage.kf.setImage(with: url)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoShowSegue",
        let destinationVC = segue.destination as? PhotosOfFriendController,
            let indexPath = tableView.indexPathForSelectedRow{
            destinationVC.userId = friends[indexPath.row].userId
        }
    }
}
