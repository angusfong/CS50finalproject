//
//  AddViewController.swift
//  TestFP
//
//  Created by Angus Fong on 3/12/2015.
//  Copyright © 2015 Angus Fong. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var newTaskName: UITextField!
    @IBOutlet weak var newTaskDescription: UITextField!
    @IBOutlet weak var newTaskLocation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(sender: AnyObject) {
        taskManager.addTask(newTaskName.text!, description: newTaskDescription.text!, location: newTaskLocation.text!)
        self.view.endEditing(true)
        newTaskName.text = ""
        newTaskDescription.text = ""
        newTaskLocation.text = ""
    
        let t:UITableViewController = self.navigationController?.viewControllers[1] as! UITableViewController
        
        t.tableView.reloadData()
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField:UITextField)->Bool {
        textField.resignFirstResponder()
        return true
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
