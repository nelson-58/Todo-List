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
        
        
    }
    
    override func viewDidLoad() {

        // Comes here with corrected selectedToDo but doesn't display
        // print("Segue moveToComplete executed with slectedToDo \(selectedToDo.toDoItem)")
        print (titleLabel.text)
        titleLabel.text = selectedToDo.toDoItem
        titleLabel.text = "wregerg"
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
