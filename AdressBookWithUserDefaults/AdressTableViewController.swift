//
//  AdressTableViewController.swift
//  AdressBookWithUserDefaults
//
//  Created by MacBookPro on 04.02.2022.
//

import UIKit

class AdressTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Base.shared.adresses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if let dcell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell = dcell
        } else {
            cell = UITableViewCell()
        }
        
        cell.textLabel?.text = Base.shared.adresses[indexPath.row].description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DispatchQueue.main.async {
                Base.shared.deleteAdress(index: indexPath)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
