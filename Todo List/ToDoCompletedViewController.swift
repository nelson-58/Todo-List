//
//  ToDoCompletedViewController.swift
//  Todo List
//
//  Created by Andy Harris on 20/02/2018.
//  Copyright © 2018 Andy Harris. All rights reserved.
//

import UIKit

class ToDoCompletedViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    // create an access reference point for the calling screen
    var previousVC = ToDoTableViewController()
    
    // create a todo object to hold the to do item passed with segue
    // this is the version without persistent data
    // var selectedToDo = ToDo()
    
    // Now using persistent data......
    
    // selectedToDo is of type todocoredata. It's optional, hence "?"
    var selectedToDo : ToDoCoreData?
    
    @IBAction func CompletedClicked(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
                context.delete(theToDo)
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
            
        
        /* this next section was for when we didn't use core data
 
        var index = 0
        for toDo in previousVC.toDos{
            if toDo.toDoItem == selectedToDo?.toDoItem{
                
                previousVC.toDos.remove(at: index)
                // refresh the tableview for previous screen
                previousVC.tableView.reloadData()
                // and pop the prior screen
                navigationController?.popViewController(animated: true)
                // breal out of loop ... the item has been found
                break
            }
            index += 1
            */
            
        }
 
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // I took out the super.viewDidLoad() and it didn't display if the label is centered horizontally to "Superview"
        // i need to try it with the super back in
        
            // selectedToDo is an optional. The following means display the toDoItem selected from the tableview (1st screen) if there is a value, otherwise do nothing.
            titleLabel.text = selectedToDo?.toDoItem
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
