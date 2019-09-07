//
//  ListOfGroupsController.swift
//  FriendsInVK
//
//  Created by Darya Bodaykina on 13/08/2019.
//  Copyright © 2019 alexleru. All rights reserved.
//

import UIKit
import RealmSwift

class ListOfGroupsController: UITableViewController {

    //MARK - constants
    private var groups: Results<Group>? = nil
    private var token: NotificationToken? = nil
    private let networkService = NetworkService();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadGroups()
        loadDataGroups()
    }
    
    
    func loadDataGroups(){
        let realm = try? Realm()
        groups = realm?.objects(Group.self)
        token = (groups!.observe{ [weak self] (changes: RealmCollectionChange) in
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
        return groups!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfGroupsCell", for: indexPath) as? ListOfGroupsCell else { fatalError("Problem with ListOfGroupsCell")}

        cell.listOfGroupsNameLabel.text = groups![indexPath.row].name
        cell.listOfGroupsDescLabel.text = groups![indexPath.row].descriptions

        return cell
    }
}
