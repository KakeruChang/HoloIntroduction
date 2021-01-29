import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        
    }
    
    // MARK: - tableview data source methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self
    
        return cell
    }
    
    // SwipeTableViewCellDelegate methods
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            self.deleteModel(at: indexPath)
        }
        let editAction = SwipeAction(style: .destructive, title: "Edit") { action, indexPath in
            // handle action by updating model with edition
            self.updateModel(at: indexPath)
        }
        
        // customize the action appearance
        deleteAction.image = UIImage(systemName: "trash.fill")
        editAction.image = UIImage(systemName: "pencil")
        editAction.backgroundColor = UIColor(red: 238/255, green: 162/255, blue: 57/255, alpha: 1)
        
        return [deleteAction, editAction]
    }
    

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    func updateModel(at indexPath: IndexPath) {
        // update
    }
    func deleteModel(at indexPath: IndexPath) {
        // delete
    }
    
}

