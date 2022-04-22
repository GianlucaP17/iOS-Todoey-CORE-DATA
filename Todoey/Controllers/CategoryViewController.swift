//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Gianluca Posca.
//  Copyright (c) Gianluca Posca. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var itemArray : [Categories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
    }
    
    // MARK: - tableview data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    // MARK: - delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! TodoListViewController
        //grab category, mi passo da did select row
        // vedo se c'è una row selezionata
        if let indexPath = tableView.indexPathForSelectedRow {
            destVC.selectedCategory = itemArray[indexPath.row]
        }
    }
    
    // MARK: - add new items
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Categories(context: self.context)
            newItem.name = textField.text!
            
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        alert.addTextField { (alertTF) in
            alertTF.placeholder = "Create new item"
            textField = alertTF
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func saveItems()  {
        do {
            try context.save()
        } catch {
            debugPrint(error, "saving context")
        }
        self.tableView.reloadData()
    }
    
    func loadItems(with request : NSFetchRequest<Categories> = Categories.fetchRequest()) {
        do {
            itemArray = try context.fetch(request)
        } catch {
            debugPrint(error, "fetching req")
        }
        tableView.reloadData()
    }
    
}
