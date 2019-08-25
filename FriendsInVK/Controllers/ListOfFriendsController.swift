//
//  ListOfFriendsController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit

class ListOfFriendsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService().loadFriends()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfFriendsCell", for: indexPath) as? ListOfFriendsCell else {fatalError("Problem with ListOfFriendsCell")}

        cell.listOfFriendsLabel.text = "ddddddddddddddddddddddddddd"
        
        return cell
    }
}
