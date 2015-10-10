//
//  AddViewController.swift
//  TodoList
//
//  Created by Jasmine Giang on 10/9/15.
//  Copyright © 2015 Jasmine Giang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    var todo : Todo?
    
    @IBOutlet var addButton: UIBarButtonItem!
    @IBOutlet var todoInput: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (sender !== addButton) {
            return
        }
        if (todoInput.text!.characters.count > 0) {
            todo = Todo(input: todoInput.text!)
        }
    }
//    @IBAction func addTodo(sender: UIBarButtonItem) {
//        if (todoInput.text!.characters.count > 0) {
//            todo = Todo(input: todoInput.text!)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
