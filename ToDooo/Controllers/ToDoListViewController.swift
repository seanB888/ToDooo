//
//  ViewController.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    // the itemArray
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Wash The Car"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Wash The Bike"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Get Water"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Get Salmon"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Fast"
        itemArray.append(newItem4)
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        } else {
//            print("Did not get the data from itemArray.")
//        }
        
    }
    
    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // using the ternary operator
        // value = condition ? valueIfTrue : ValueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
            
        return cell
        }
    
    // MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        // this will reload the data to the tableView
        tableView.reloadData()
        
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
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
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

