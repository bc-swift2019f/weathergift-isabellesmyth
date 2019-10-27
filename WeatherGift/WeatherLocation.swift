//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/20/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    
    func getWeather(completed: @escaping () -> ()){
        let weatherURL = urlBase + urlAPIKey + coordinates
     
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "˚"
                    
                } else {
                    print("could not return a temperature")
                }
                if let summary = json["daily"]["summary"].string {
                    self.currentSummary = summary
                    
                } else {
                    print("could not return a summary")
                }
                if let icon = json["daily"]["icon"].string {
                    self.currentIcon = icon
                    
                } else {
                    print("could not return an icon")
                }
                if let timeZone = json["timezone"].string {
                    self.timeZone = timeZone
                    
                } else {
                    print("could not return a time zone")
                }
                
                if let time = json["currently"]["time"].double {
                    self.currentTime = time
                    
                } else {
                    print("could not return a time")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
