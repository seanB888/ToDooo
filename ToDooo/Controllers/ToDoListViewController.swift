//
//  ViewController.swift
//  ToDooo
//
//  Created by SEAN BLAKE on 8/14/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    // This is the global area
    // the itemArray
    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        
        // loadItems loads the data in the tableView
        loadItems()
        
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
        
        saveItem()
        
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
            
            self.saveItem()
//            let encoder = PropertyListEncoder()
//
//            do {
//                let data = try encoder.encode(self.itemArray)
//                try data.write(to: self.dataFilePath!)
//            } catch {
//                print("ERROR ENCODING: itemArray, \(error)")
//            }
//            self.tableView.reloadData()
        }
        
        // textField in Alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create A New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK - Model Manipulation Method
    
    func saveItem() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("ERROR ENCODING: itemArray, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems() {
        // using OPTIONAL BINDING
        if let data = try? Data(contentsOf: dataFilePath!) {
            // decoder to decode the item
            let decoder = PropertyListDecoder()
            // creates a new object of the class
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("ERROR: Error Decoding \(error)")
            }
        }
    }
}

