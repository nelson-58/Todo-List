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
    var selectedToDo = ToDo()
    
    
    @IBAction func CompletedClicked(_ sender: Any) {
        
        var index = 0
        for toDo in previousVC.toDos{
            if toDo.toDoItem == selectedToDo.toDoItem{
                // print ("Yay: index = \(index)")
                // remove the item at the point
                previousVC.toDos.remove(at: index)
                // refresh the tableview for previous screen
                previousVC.tableView.reloadData()
                // and pop the prior screen
                navigationController?.popViewController(animated: true)
                // breal out of loop ... the item has been found
                break
            }
            index += 1
        }
        
    }
    
    override func viewDidLoad() {

        // Doesn't display if the label is centered horizontally to "Superview"!?!

        titleLabel.text = selectedToDo.toDoItem
       
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
