//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/20/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import Alamofire
class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather(){
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        
        Alamofire.request(weatherURL).responseJSON { reponse in print(reponse)
        }
    }
}
