//
//  ViewController.swift
//  TodoList
//
//  Created by Jasmine Giang on 10/9/15.
//  Copyright © 2015 Jasmine Giang. All rights reserved.
//

import UIKit

var todos = [Todo]()

class ViewController: UIViewController {
    
    @IBOutlet var todoTable: UITableView!
    var doneCount = 0;
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let todo = todos[indexPath.row] as Todo
        cell.textLabel!.text = todo.text
        if (todo.done == true) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var todo = todos[indexPath.row] as Todo
        todo.done = !todo.done
        if (todo.done) {
            todo.doneTime = NSDate()
            self.doneCount += 1
        } else {
            self.doneCount -= 1
        }
        tableView.reloadData()

    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {

    }
    
    @IBAction func unwindAdd(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddViewController
        let todo = source.todo as Todo!
        if (todo != nil) {
            todos.append(todo)
            print(todos)
            todoTable.reloadData()
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

