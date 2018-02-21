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

    var toDos : [ToDo] = []
    
    // function to create  a array of items of classToDo
    func createToDo()-> [ToDo]{
        
        
        let eggs = ToDo()
        eggs.toDoItem = "Buy eggs"
        
        let food = ToDo()
        food.toDoItem = "Food shopping"
        food.important = true
        
        return [eggs,food]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // When the screen first loads, create a dummy array of ToDo items for demo purposes
        // will be replaced by persistent mememory in due course
        toDos = createToDo()
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of rows required in the table = the number of items in the the toDo array
        
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 'myToDoCell" refers to the prototype cell in the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "myToDoCell", for: indexPath)
        let todo = toDos[indexPath.row]
        if todo.important {
            cell.textLabel?.text = "!\(todo.toDoItem)"
        } else {
            cell.textLabel?.text = todo.toDoItem
            
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // This function is called if the user clicks on a row in the table
        //
        //get the todo item for that row, and perform the segue, sending a reference to the todo item to the new screen
        let todo = toDos[indexPath.row]
        
        print("Going to segue to moveToComplete with todo \(todo.toDoItem)")
        
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
            if let toDo = sender as? ToDo {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        
    }

}
