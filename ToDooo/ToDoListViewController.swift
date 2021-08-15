//
//  ViewController.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    // the itemArray
    var itemArray = ["Start A Blog", "Rebuild Bike", "Exercise", "Play Ball", "Wash Car"]

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
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
        
        // giving a checkmark using accessory method
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // mask the row flash from gray back to white when tapped
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        // alert
        let alert = UIAlertController(title: "Add A New ToDooo", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen when Add Item is tapped
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
        }
        
        // textField in Alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create A New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

