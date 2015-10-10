//
//  Todo.swift
//  TodoList
//
//  Created by Jasmine Giang on 10/9/15.
//  Copyright © 2015 Jasmine Giang. All rights reserved.
//

import Foundation

struct Todo {
    var text : String
    var done : Bool
    var doneTime : NSDate
    
    init(input: String) {
        self.text = input
        self.done = false
        self.doneTime = NSDate()
    }
}