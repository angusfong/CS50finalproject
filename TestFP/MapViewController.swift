//
//  MapViewController.swift
//  TestFP
//
//  Created by Angus Fong on 2/12/2015.
//  Copyright © 2015 Angus Fong. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        
    }
   
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
        let location = locations.last as CLLocation!
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) /*TODO: depend on scope of tasks*/)
        
        self.mapView.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
        
        
    }
    
    @IBAction func addPin(sender: UILongPressGestureRecognizer) {
        
        let annotation = MKPointAnnotation()
        
        let location = sender.locationInView(self.mapView)
        
        if (sender.state == UIGestureRecognizerState.Ended){

            let localCoordinate = self.mapView.convertPoint(location, toCoordinateFromView: self.mapView)
            
            if let t = self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as? UIViewController? {
                
                annotation.coordinate = localCoordinate
                
                annotation.title = taskManager.tasks[taskManager.tasks.count-1].name
                
                annotation.subtitle = taskManager.tasks[taskManager.tasks.count-1].description
                
                taskManager.tasks[taskManager.tasks.count-1].pin = annotation
                
                self.mapView.addAnnotation(annotation)

            }
            
            
            
            else {
         
                var namet = ""
                
                var descriptiont = ""
                
                
                    NSLog("UIGestureRecognizerStateBegan.");
                    
                    //Do Whatever You want on Began of Gesture
                    
                    let popup = UIAlertController(title: "Add Task:", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                  
                    popup.addTextFieldWithConfigurationHandler {
                      
                        (name) -> Void in
                      
                        name.placeholder = "Name"
                        
                    }
                    
                 popup.addTextFieldWithConfigurationHandler {
                        
                    (description) -> Void in
                        
                    description.placeholder = "Description"
                    
                    }
                   
                popup.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
                    
                    (action) -> Void in
                    
                    let namef = popup.textFields![0] as UITextField
                    
                    let descriptionf = popup.textFields![1] as UITextField

                    
                    self.view.endEditing(true)
                   
                    namet = namef.text!
               
                    descriptiont = descriptionf.text!
                    
                   let localCoordinate = self.mapView.convertPoint(location, toCoordinateFromView: self.mapView)
                    
                    annotation.coordinate = localCoordinate
                   
                    annotation.title = namet
                   
                    annotation.subtitle = descriptiont
                   
                    taskManager.addTask(namef.text!, description: descriptionf.text!, pin: annotation)
                    
                   self.mapView.addAnnotation(annotation)
                }))
                
            
 
            
            // if pushed here from Add, appear annotation with given name and description, add pin
        
            popup.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: {
                
                (action) -> Void in
          
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }))
            
            self.presentViewController(popup, animated: true, completion: nil)
          
        }
     
    }
    }
    
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
 
    func textFieldShouldReturn(textField:UITextField)->Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    
        print("Error while updating location " + error.localizedDescription)
     
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