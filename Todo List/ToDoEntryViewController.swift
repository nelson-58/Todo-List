//
//  ToDoEntryViewController.swift
//  Todo List
//
//  Created by Andy Harris on 20/02/2018.
//  Copyright © 2018 Andy Harris. All rights reserved.
//

import UIKit

class ToDoEntryViewController: UIViewController {

    @IBOutlet weak var toDoName: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC  =  ToDoTableViewController()        // Creat instance of VC
    
    @IBAction func addButton(_ sender: Any) {
    
        let toDo = ToDo()        // New ToDO object
        
        if let todoText = toDoName.text {
            // if text exists, then load info from the screeninto the ToDo object
            toDo.toDoItem = todoText
            toDo.important = importantSwitch.isOn
            // then append object to the toDos array in "previousVC" screen
            previousVC.toDos.append(toDo)
            // refresh table
            previousVC.tableView.reloadData()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
       
        
    }
    */

}
