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


class MapViewController: UIViewController, CLLocationManagerDelegate{
    
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
        /*TODO: Add item to [tasks] within taskManager*/
        /*TODO: ALlow user to input task Name, Description and Location EITHER ON ADDVIEWCONTROLLER OR ALERT(TBD)*/
        /*TODO: Allow dragging without dropping pin*/
        /*TODO: Function to enable and set Geofencing*/
        
        let location = sender.locationInView(self.mapView)
        
        let localCoordinate = self.mapView.convertPoint(location, toCoordinateFromView: self.mapView)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = localCoordinate
        
        
        /*TODO: Custom dynamic Name and Description*/
        /*TODO: Check if possible to have annotation as form*/
        annotation.title = "Task"
        
        annotation.subtitle = "Testing 123"
        
        self.mapView.addAnnotation(annotation)
        
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