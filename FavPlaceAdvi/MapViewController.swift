//
//  MapViewController.swift
//  FavPlaceAdvi
//
//  Created by Ahmet Zincir on 20.05.2024.
//

import UIKit
import MapKit
import FirebaseDatabase


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapV: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveFunc))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backFunc))
        
        mapV.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(choosenLoc(gestureRecognizer:)))
        mapV.addGestureRecognizer(gesture)
        
    }
    @objc func choosenLoc(gestureRecognizer: UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            let touches = gestureRecognizer.location(in: self.mapV)
            let coordinates = self.mapV.convert(touches, toCoordinateFrom: self.mapV)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinates
            annotation.title = MyModel.sharedIns.placeName
            annotation.subtitle = MyModel.sharedIns.placeKind
            
            self.mapV.addAnnotation(annotation)
            
            MyModel.sharedIns.placeLat = String(coordinates.latitude)
            MyModel.sharedIns.placelon = String(coordinates.longitude)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.035, longitudeDelta: 0.035)
        let region = MKCoordinateRegion(center: location, span: span)
        mapV.setRegion(region, animated: true)
    }
    
    
    @objc func saveFunc(){
        
    

        
    }
    @objc func backFunc(){
        self.dismiss(animated: true, completion: nil)
    }
}
