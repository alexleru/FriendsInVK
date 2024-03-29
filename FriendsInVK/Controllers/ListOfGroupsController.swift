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
    private let networkService = NetworkService()
    private var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.loadGroups() {[weak self] in
            self?.loadDataGroups()
            self?.tableView.reloadData()
        
        }

    }
    
    func loadDataGroups(){
        do {
            let realm = try Realm()
            let groups = realm.objects(Group.self)
            self.groups = Array(groups)
        } catch {
            print(error)
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListOfGroupsCell", for: indexPath) as? ListOfGroupsCell else { fatalError("Problem with ListOfGroupsCell")}

        cell.listOfGroupsNameLabel.text = groups[indexPath.row].name
        cell.listOfGroupsDescLabel.text = groups[indexPath.row].description

        return cell
    }
}
