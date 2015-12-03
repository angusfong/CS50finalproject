//
//  TaskManager.swift
//  TestFP
//
//  Created by Angus Fong on 2/12/2015.
//  Copyright © 2015 Angus Fong. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct task {
    var name:String = "NoName"
    var description:String = "NoDescription"
    var location:String = "NoLocation"
}

class TaskManager: NSObject {
    var tasks = [task]()
 
    func addTask(name:String, description:String, location:String) {
        tasks.append(task(name:name, description:description, location:location))
    }
}
