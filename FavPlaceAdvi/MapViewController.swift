//
//  MapViewController.swift
//  FavPlaceAdvi
//
//  Created by Ahmet Zincir on 20.05.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapV: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveFunc))
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backFunc))
    }
    
    @objc func saveFunc(){
        self.performSegue(withIdentifier: "toDetailsVc", sender: nil)
    }
    @objc func backFunc(){
        self.dismiss(animated: true, completion: nil)
    }
}
