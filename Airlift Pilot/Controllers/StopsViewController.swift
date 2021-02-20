//
//  StopsViewController.swift
//  Airlift Pilot
//
//  Created by Saad on 2/18/21.
//

import UIKit

class StopsViewController: UIViewController {

    var stops = [Stop]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Route Stops"
    }
}

extension StopsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stopsCell", for: indexPath) as! StopsTableViewCell
        cell.lblStopName.text = stops[indexPath.row].name
        return cell
    }
}
