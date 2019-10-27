//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/27/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
        
    }
    
}
