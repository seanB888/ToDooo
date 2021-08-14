//
//  ViewController.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    // the itemArray
    let itemArray = ["Start A Blog", "Rebuild Bike", "Exercise"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            cell.textLabel?.text = itemArray[indexPath.row]
            
            return cell
        }
}

