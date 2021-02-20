//
//  RoutesViewController.swift
//  Airlift Pilot
//
//  Created by Saad on 2/19/21.
//

import UIKit
import CoreLocation

class RoutesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var routes = [Route]()
    let dateFormatter = DateFormatter()
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    var stopLocations = [CLLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Routes"
        dateFormatter.dateFormat = "HH:mm"
        getRoutes()
        getCurrentLocation()
    }
    
    func getRoutes() {
        let dataManager = DataManager()
        routes = dataManager.loadRoutes()
    }
    
    func getCurrentLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

extension RoutesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "routesCell", for: indexPath) as! RoutesTableViewCell
        cell.lblRouteName.text = routes[indexPath.row].name
        cell.lblStartTime.text = dateFormatter.string(from: routes[indexPath.row].startTime)
        cell.lblEndTime.text = dateFormatter.string(from: routes[indexPath.row].endTime)
        cell.btnShowStops.tag = indexPath.row
        cell.btnShowStops.addTarget(self, action: #selector(showStops(_:)), for: .touchUpInside)
        return cell
    }
}

extension RoutesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateWithStopsAtRouteIndex(indexPath.row)
    }
    
    @objc func showStops(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StopsVC") as! StopsViewController
        vc.stops = routes[sender.tag].stops
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateWithStopsAtRouteIndex(_ index: Int) {
        var urlString = "https://www.google.com/maps/dir/\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)/"
        let stops = routes[index].stops
        for stop in stops {
            if stop.active {
                urlString += "\(stop.lat),\(stop.long)/"
            }
            stopLocations.append(CLLocation(latitude: stop.lat, longitude: stop.long))
        }
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
}

extension RoutesViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last! as CLLocation
        for stopLocation in stopLocations {
            if currentLocation.distance(from: stopLocation) == 0.0 {
                _ = currentLocation.timestamp
                // save this timestamp, current location and userID to the server
            }
        }
    }
}
