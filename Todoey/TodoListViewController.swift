//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//  2024/01/16

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["参考書を買う", "支払いをする", "更新する"]

    override func viewDidLoad() {
        super.viewDidLoad()



    }


    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
                
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            //ユーザーがUIAlertActionをタップしたときに実行されるコード
            print("Success!")
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

