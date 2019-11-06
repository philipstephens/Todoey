//
//  ViewController.swift
//  Todoey
//
//  Created by Philip Stephens on 2019-10-12.
//  Copyright © 2019 Philip Stephens. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemsArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Do dishes"
        itemsArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemsArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Sweep Floor"
        itemsArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemsArray = items
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.completed ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("row selected: \(indexPath.row) -> \(itemsArray[indexPath.row].title)")
        
        itemsArray[indexPath.row].toggle()
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // add button item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey item", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textField.text!
            self.itemsArray.append(newItem)
            self.defaults.set(self.itemsArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
 
        present(alert, animated: true, completion: nil)
    }
}

