//
//  ToDoListTableViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2020/12/27.
//

import UIKit
import RealmSwift
// import CoreData

class ToDoListTableViewController: UITableViewController {
    
    // var itemArray = [ToDoItem]()
    var todoItems: Results<ItemRealm>?
    // var selectedCategory: Category? {
    var selectedCategory: CategoryRealm? {
        didSet{
            loadToDoItems()
        }
    }
    
    // let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ToDoItems.plist")
    // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let realm = try! Realm()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loadToDoItems()
        
        searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Item Added"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // delete
        // context.delete(itemArray[indexPath.row])
        // itemArray.remove(at: indexPath.row)
        // edit
        // todoItems[indexPath.row].done = !todoItems[indexPath.row].done
        // saveToDoItems()
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                    // delete
                    // realm.delete(item)
                }
            } catch {
                print("error saving done status\(error)")
            }
            
        }
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - add new item
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        var  textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add new to item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            if let currrentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        // let newTodo = ToDoItem(context: self.context)
                        let newTodo = ItemRealm()
                        newTodo.title = textField.text! // text of textField won;t be empty
                        newTodo.dateCreated = Date()
                        
                        // newTodo.parentCategory = self.selectedCategory
                        currrentCategory.itemRealms.append(newTodo)
                        //
                        // self.itemArray.append(newTodo)
                        //
                    }
                } catch {
                    print("Add new items fail:\(error)")
                }
                
            }
            self.tableView.reloadData()
            
            // self.saveToDoItems()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "enter sth."
            
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - save / load todo item
    //    func saveToDoItems() {
    //        // let encoder = PropertyListEncoder()
    //        do {
    //            try context.save()
    //            // let data = try encoder.encode(itemArray)
    //            // try data.write(to: dataFilePath!)
    //        } catch {
    //            print("error saving item array, \(error)")
    //        }
    //
    //        tableView.reloadData()
    //    }
    
    // func loadToDoItems(with request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest(), predicate: NSPredicate? = nil) {
    func loadToDoItems() {
        
        todoItems = selectedCategory?.itemRealms.sorted(byKeyPath: "title", ascending: true)
        
        //        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
        //
        //        if let predicate = predicate {
        //            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate, categoryPredicate])
        //        } else {
        //            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate])
        //        }
        //
        //        do {
        //            itemArray = try context.fetch(request)
        //        } catch {
        //            print("fetch todo item error \(error)")
        //        }
        
        tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate
extension ToDoListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "title", ascending: true)
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
        
        //        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()
        //
        //        print(searchBar.text!)
        //        let predicate = NSPredicate(format: "title CONTAINS %@", searchBar.text!)
        //
        //        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        //
        //        loadToDoItems(with: request, predicate: predicate)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadToDoItems()
            
            DispatchQueue.main.async {
                // dismiss keyboard...
                searchBar.resignFirstResponder()
            }
            
        }
    }
}
