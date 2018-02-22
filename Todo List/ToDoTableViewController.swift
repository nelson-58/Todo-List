//
//  ToDoTableViewController.swift
//  Todo List
//
//  Created by Andy Harris on 20/02/2018.
//  Copyright © 2018 Andy Harris. All rights reserved.
//

import UIKit


//create an (empty) array of ToDo objects



class ToDoTableViewController: UITableViewController {

    var toDos : [ToDoCoreData] = []
    
    // function to create  a array of items of classToDo with dummy data to get things going
    /*
    func createToDo()-> [ToDo]{
        
        
        let eggs = ToDo()
        eggs.toDoItem = "Buy eggs"
        
        let food = ToDo()
        food.toDoItem = "Food shopping"
        food.important = true
        
        return [eggs,food]
        
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // When the screen first loads, create a dummy array of ToDo items for demo purposes
        // will be replaced by persistent mememory in due course
        // toDos = createToDo()
        

    
    }

    override func viewWillAppear(_ animated: Bool) {
        // called every time the screen appears
        // Every time  time screen appears, get the data from core data
        
        getToDos()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows required in the table = the number of items in the the toDo array
        
        return toDos.count
    }

    func getToDos(){
        
        // get all To Do objects out of core data and put them into the ToDos array. Then reload the table view
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            // get all To Do objects out of core data as an array of ToDoCoreData objects
            // coreDataToDos is an an array of optional objects

            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData]{
                
                // If the fetch is successful, load the toDos array with the data from core data
                
                if let theToDos = coreDataToDos{
                    // coreDataToDos is an an array of optional objects, so need an "if let"
                    // so now load up array
                    
                    toDos = theToDos
                    
                    // then rebuild the table view from the array
                    tableView.reloadData()
                }
            }

        }
            
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Load the data from the ToDos rray into the cells
        // 'myToDoCell" refers to the prototype cell in the table
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myToDoCell", for: indexPath)
        // get the todo item for that row out of the toDos array
        let todo = toDos[indexPath.row]
        
         // toDoItem is optional, so use "if let" to unbundle it
        if let name = todo.toDoItem{
        
                if todo.important {
                    cell.textLabel?.text = "!\(name)"
                } else {
                    cell.textLabel?.text = name
                    
                }
            }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // This function is called if the user clicks on a row in the table
        //
        //get the todo item for that row, and perform the segue, sending a reference to the todo item to the new screen
        let todo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Assuming segue to the "add" screen, addVC will be destination screen ,  but only if the segue destination is  the ToDoEntryViewController class
        if let addVC = segue.destination as? ToDoEntryViewController{
            
            // This modifies the previousVC variable in the ToDoEntryViewController screen class to point back to this screen
            addVC.previousVC = self
            // Assuming segue to "Complete" screen, completeVC will reference the destination
            
        }
        
        // This modifies the previousVC variable in the ToDoEntryViewController screen class to point back to this screen, but only if the segue destination is  the ToDoCompletedVC class
        if let completeVC = segue.destination as? ToDoCompletedViewController {
            
            // If sender type is of ToDo class, then pass it with the segue, otherwise leave it
            // ALWAYS FAILS THIS SO NEVER LOADS THE PREVIOUSVC
            // WHAT SETS THE SENDER  WITH THE TODO
            if let toDo = sender as? ToDoCoreData {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        
    }

}
