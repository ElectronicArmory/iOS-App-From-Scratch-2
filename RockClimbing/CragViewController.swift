//
//  CragViewController.swift
//  RockClimbing
//
//  Created by Electronic Armory on 11/5/19.
//  Copyright © 2019 Electronic Armory. All rights reserved.
//

import UIKit
import MapKit


class CragViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var currentLocation:CLLocation?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentLocation = LocationController.currentLocation
        
        if( currentLocation != nil ){
            zoomToLocationOnMap()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(locationDidUpdate(notification:)), name: NSNotification.Name(rawValue: LocationController.NOTIFICATION_LOCATION_DID_UPDATE), object: nil)
    }
    
    
    @objc
    func locationDidUpdate(notification:Notification){
        let currentLocation = LocationController.currentLocation
        
        // Zoom in on map
        zoomToLocationOnMap()
    }
    
    
    func zoomToLocationOnMap(){
        if let locationToZoomInOn = currentLocation?.coordinate {
            mapView.setRegion(MKCoordinateRegion(center: locationToZoomInOn, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
