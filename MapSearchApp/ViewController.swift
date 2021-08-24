//
//  ViewController.swift
//  MapSearchApp
//
//  Created by manish on 24/08/21.
//

import UIKit
import MapKit

class ViewController: UIViewController,UISearchBarDelegate{

    let locationManager = CLLocationManager()
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var searchCountry: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.titleView = searchCountry
        searchCountry.delegate = self
    }
    
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       
        let searchValue = MKLocalSearch.Request()
        searchValue.naturalLanguageQuery = searchCountry.text
        let activeSearch = MKLocalSearch(request: searchValue)
        
        activeSearch.start { (response, error) in
            if response == nil {
                print(error?.localizedDescription ?? "")
            }else{
                
                let lat = response?.boundingRegion.center.latitude
                let long = response?.boundingRegion.center.longitude
                print("latitude= \(lat),longitude=\(long)")
                
                let annotation = MKPointAnnotation()
                annotation.title = self.searchCountry.text
                annotation.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
                self.mapView.addAnnotation(annotation)
                
                let coodinaate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat!, long!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coodinaate, span: span)
                
                self.mapView.setRegion(region, animated: true)
            }
        }
        
        
    }


}

