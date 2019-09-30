
// mapPage.swift
//  task3
//
//  Created by IMAC on 7/15/19.
//  Copyright © 2019 IMAC. All rights reserved.
//
//
import UIKit
import MapKit
import CoreLocation

class mapPage: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate,UISearchBarDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    let newPin = MKPointAnnotation()

    var locationManager: CLLocationManager!
    var latitudeVal:Double! = nil
    var longtitudeVal:Double! = nil
    var regionRadius: CLLocationDistance = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()

         self.mapView.showsUserLocation = true

    }


    //Mark: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)



        determineMyCurrentLocation()
    }
    func determineMyCurrentLocation() {

        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    //Location Manager Updating Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("locations is \(locations)")
        let userLocation:CLLocation = locations[0] as CLLocation
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.

        // manager.stopUpdatingLocation()

        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")

        latitudeVal = userLocation.coordinate.latitude
        longtitudeVal = userLocation.coordinate.longitude

        latitudeVal = 12.979650
        longtitudeVal = 77.636490
        //after fetching coordinates showing MapView
        mapView.delegate = self
        setMapView()
    }
    //Error Handling Method
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

    //Set MapView
    func setMapView() {
        let setInitialLocation = CLLocation(latitude: latitudeVal, longitude: longtitudeVal)
        regionRadius = 1200

        centerMapOnLocation(location: setInitialLocation)
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        //Here Setting Annotation to the MapView ->Single Annotation
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(latitudeVal, longtitudeVal);
        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)




        //Mutliple Annotation Based on our requirement
        ////        let locations = [
        ////            ["title": "Cinepolis",    "latitude": 17.4900, "longitude": 78.3933],
        ////            ["title": "Function Hall",    "latitude": 17.4903, "longitude": 78.3939],
        ////            ["title": "Forum Mall", "latitude": 17.4843, "longitude": 78.3889]
        ////
        ////        ]
        ////        print("locations arr is \(locations)")
        ////        for location in locations {
        ////            let annotation = MKPointAnnotation()
        ////            annotation.title = location["title"] as? String
        ////            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
        ////            mapView.addAnnotation(annotation)
        ////        }
        ////        //poly line purpose
        //
        //
    }




    //This is used for map searching and showing results
    @IBAction func searchBar(_ sender: UIBarButtonItem) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self as! UISearchBarDelegate
        present(searchController, animated: true, completion: nil)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()

        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()

        self.view.addSubview(activityIndicator)

        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)

        //Create the search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text

        let activeSearch = MKLocalSearch(request: searchRequest)

        activeSearch.start { (response, error) in

            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()

            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)

                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude

                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)

                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
            }


        }

    }
    @IBAction func showNearBy(_ sender: UIButton) {

        let story = UIStoryboard(name: "Main", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "tabBarController")
        self.navigationController?.pushViewController(vc, animated: true)


    }

    @IBAction func showAllStores(_ sender: UIButton) {

        let story = UIStoryboard(name: "Main", bundle:  nil)
        let vc = story.instantiateViewController(withIdentifier: "tabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
        //self.performSegue(withIdentifier: "mySegueIdentifier", sender: nil)
        
     
    }

}
