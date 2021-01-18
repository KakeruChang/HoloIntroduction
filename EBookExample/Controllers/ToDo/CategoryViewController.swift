//
//  CategoryViewController.swift
//  EBookExample
//
//  Created by ChangTingWei on 2021/1/3.
//

import UIKit
// import CoreData
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    // var categories = [Category]()
    // var categories = [CategoryRealm]()
    var categories: Results<CategoryRealm>?
    // let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    func loadCategories() {
        //        let request: NSFetchRequest<Category> = Category.fetchRequest()
        //        do {
        //            categories = try context.fetch(request)
        //        } catch  {
        //            print("error loading category: \(error)")
        //        }
        categories = realm.objects(CategoryRealm.self)
        
        tableView.reloadData()
    }
    
    // func saveCategories() {
    func save(category: CategoryRealm) {
        do {
            // try context.save()
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("error saving category: \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // let newCategory = Category(context: self.context)
            let newCategory = CategoryRealm()
            newCategory.name = textField.text!
            
            // self.categories.append(newCategory)
            // self.saveCategories()
            self.save(category: newCategory)
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories?[indexPath.row].name ?? "No Categories Added Yet"
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToToDoItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationTVC = segue.destination as! ToDoListTableViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationTVC.selectedCategory = categories?[indexPath.row]
        }
    }
}
