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

        toDos = createToDo()
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myToDoCell", for: indexPath)

        let todo = toDos[indexPath.row]
      
        if todo.important {
            cell.textLabel?.text = "!\(todo.toDoItem)"
        } else {
            cell.textLabel?.text = todo.toDoItem
            
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //addVC is destination screen , as subclass ToDoEntryVC
        let addVC = segue.destination as! ToDoEntryViewController
        // modify the previousVC variable in the destination screen class to point back to this screen class
        addVC.previousVC = self
        
    }

}
