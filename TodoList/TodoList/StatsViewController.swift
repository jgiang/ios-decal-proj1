//
//  StatsViewController.swift
//  TodoList
//
//  Created by Jasmine Giang on 10/9/15.
//  Copyright © 2015 Jasmine Giang. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet var doneLabel: UILabel!
    var todos : [Todo]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        doneLabel.text = countTodos()
    }
    
    func countTodos() -> String {
        var count = 0;
        for todo in todos! {
            if todo.done {
                count += 1
            }
        }
        return String(count)
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
