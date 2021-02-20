//
//  DataManager.swift
//  Airlift Pilot
//
//  Created by Saad on 2/20/21.
//

import Foundation

class DataManager: NSObject {
    
    let dateFormatter = DateFormatter()
    
    override init() {
        dateFormatter.dateFormat = "HH:mm"
    }

    func loadRoutes() -> [Route] {
        // We would get the routes data from the server in a real app
        return [
            Route(name: "RID-817151", startTime: dateFormatter.date(from: "08:00")!, endTime: dateFormatter.date(from: "09:30")!, stops: [
                Stop(name: "KU Bus Stop", lat: 24.9342312, long: 67.1269722, active: true),
                Stop(name: "NED BUS Stop", lat: 24.929635, long: 67.1139686, active: false),
                Stop(name: "Muskan Bus Stop", lat: 24.933634, long: 67.1047278, active: true),
                Stop(name: "KFC Gulshan", lat: 24.9315266, long: 67.1016128, active: true),
                Stop(name: "Opp Rab Medical", lat: 24.922035, long:  67.088714, active: true),
                Stop(name: "Diamond Super Market", lat: 24.9256303, long: 67.0662782, active: true)
            ]),
            Route(name: "RID-767675", startTime: dateFormatter.date(from: "10:15")!, endTime: dateFormatter.date(from: "12:40")!, stops: [
                Stop(name: "Diamond Super Market", lat: 24.9256303, long: 67.0662782, active: true),
                Stop(name: "Rab Medical", lat: 24.922035, long:  67.088714, active: true),
                Stop(name: "KFC Gulshan", lat: 24.9315266, long: 67.1016128, active: true),
                Stop(name: "Muskan Bus Stop", lat: 24.933634, long: 67.1047278, active: true),
                Stop(name: "NED BUS Stop", lat: 24.929635, long: 67.1139686, active: true),
                Stop(name: "KU Bus Stop", lat: 24.9342312, long: 67.1269722, active: false)
            ])
        ]
    }
}
