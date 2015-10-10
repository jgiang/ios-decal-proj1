//
//  ViewController.swift
//  TodoList
//
//  Created by Jasmine Giang on 10/9/15.
//  Copyright © 2015 Jasmine Giang. All rights reserved.
//

import UIKit

//var todos = [Todo]()

class ViewController: UIViewController {
    
    @IBOutlet var todoTable: UITableView!
    var todos = [Todo]()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let todo = todos[indexPath.row] as Todo
        cell.textLabel!.text = todo.text
        if todo.done {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        todos[indexPath.row].done = !todos[indexPath.row].done
        if todos[indexPath.row].done {
            todos[indexPath.row].doneTime = NSDate()
        }
        todoTable.reloadData()

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todos.removeAtIndex(indexPath.row)
            todoTable.reloadData()
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
  
    }
    
    @IBAction func unwindAdd(segue: UIStoryboardSegue) {
        if let source = segue.sourceViewController as? AddViewController {
            if let todo = source.todo {
                todos.append(todo)
                todoTable.reloadData()
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        for (var i = 0; i < todos.count; i++) {
            if (todos[i].done && NSDate().timeIntervalSinceDate(todos[i].doneTime) > 86400) {
                todos.removeAtIndex(i)
            }
        }
        if segue.identifier == "GoToStats" {
            let nav = segue.destinationViewController as! UINavigationController
            let dest = nav.topViewController as! StatsViewController
            dest.todos = todos
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

