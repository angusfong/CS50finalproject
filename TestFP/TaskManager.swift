//
//  TaskManager.swift
//  TestFP
//
//  Created by Angus Fong on 2/12/2015.
//  Copyright © 2015 Angus Fong. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

var taskManager: TaskManager = TaskManager()

struct task {
    var name:String = "NoName"
    var description:String = "NoDescription"
    var pin:MKPointAnnotation
}

class TaskManager: NSObject {
    var tasks = [task]()
 
    func addTask(name:String, description:String, pin:MKPointAnnotation) {
        tasks.append(task(name:name, description:description, pin:pin))
    }
}
