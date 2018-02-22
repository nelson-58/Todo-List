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
    
        /*
        this is the original code, without persistent data
         
        let toDo = ToDo()        // New ToDO object
        
        if let todoText = toDoName.text {
            // if text exists, then load info from the screeninto the ToDo object
            toDo.toDoItem = todoText
            toDo.important = importantSwitch.isOn
            // then append object to the toDos array in "previousVC" screen
            previousVC.toDos.append(toDo)
            // refresh table
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
        */
        
        // Now use persistent data
        // Get the context for the presistent container that will hold the core data
        // The context is effectively the way to interact with core data, it's the bridge to core data
        // Unwrap the context in case you can't get it for whatever reason
        // The persistent container is referenced via a delegate for the application
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            // use the context to create a new object of type ToDoCoreData in poersistent data
            // unwrap the ToDoCoreData in case there's a problem
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
            
            // now store the data in the text entry field into the core data location
            if let todoText = toDoName.text {
                // if text exists, then load info from the screeninto the ToDo object
                toDo.toDoItem = todoText
                toDo.important = importantSwitch.isOn

            }
            // save the data by saving the context
            // the try is in case it can't be saved for whatever reason; avoids a crash
            try? context.save()
            // then pop back a screen via the navigation controller
            navigationController?.popViewController(animated: true)
            
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
