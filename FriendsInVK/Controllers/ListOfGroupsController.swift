//
//  ListOfGroupsController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit

class ListOfGroupsController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfGroupsCell", for: indexPath) as? ListOfGroupsCell else { fatalError("Problem with ListOfGroupsCell")}

        cell.listOfGroupsNameLabel.text = "Name"
        cell.listOfGroupsDescLabel.text = "Decs"

        return cell
    }
}
