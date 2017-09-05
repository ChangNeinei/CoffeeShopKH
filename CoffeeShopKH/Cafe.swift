//
//  Cafe.swift
//  CoffeeShopKH
//
//  Created by Weiling Chang on 04/09/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation

struct Cafe {
    var cafename: String
    var cafeaddress: String
    var cafewifi: Double
    var cafeseat: Double
    var cafequiet: Double
    var cafetasty: Double
    var cafecheap: Double
    var cafemusic: Double
    var cafeweburl: String
    var cafeLatitude: String
    var cafeLongitude: String
    
    init?(json: [String: Any]){
        guard let cafename = json["name"] as? String, let cafeaddress = json["address"] as? String, let cafewifi = json["wifi"] as? Double, let cafeseat = json["seat"] as? Double, let cafequiet = json["quiet"] as? Double, let cafetasty = json["tasty"] as? Double, let cafecheap = json["cheap"] as? Double, let cafemusic = json["music"] as? Double, let cafeweburl = json["url"] as? String, let cafeLatitude = json["latitude"] as? String, let cafeLongitude = json["longitude"] as? String else{
            return nil
        }
        self.cafename = cafename
        self.cafeaddress = cafeaddress
        self.cafewifi = cafewifi
        self.cafeseat = cafeseat
        self.cafequiet = cafequiet
        self.cafetasty = cafetasty
        self.cafecheap = cafecheap
        self.cafemusic = cafemusic
        self.cafeweburl = cafeweburl
        self.cafeLatitude = cafeLatitude
        self.cafeLongitude = cafeLongitude
    }
}
