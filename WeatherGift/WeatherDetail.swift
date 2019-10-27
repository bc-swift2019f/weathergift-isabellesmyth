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
class WeatherDetail: WeatherLocation {
    struct HourlyForcast {
        var hourlyTime: Double
        var hourlyTemperature: Double
        var hourlyIcon: String
        var hourlyPrecipProp: Double
    }
    struct DailyForcast {
        var dailyMaxTemp: Double
        var dailyMinTemp: Double
        var dailySummary: String
        var dailyDate: Double
        var dailyIcon: String
    }
    

    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    var currentTime = 0.0
    var timeZone = ""
    var dailyForcastArray = [DailyForcast]()
    var hourlyForcastArray = [HourlyForcast]()

    

    
    func getWeather(completed: @escaping () -> ()){
        let weatherURL = urlBase + urlAPIKey + coordinates
        //print(weatherURL)
        //let weatherURL = "https://api.darksky.net/forecast/dee39b0750bcf347e85a06121c2a2bfe/37.92548060000001,-122.5274755"
        
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
                
                let dailyDataArray = json["daily"]["data"]
                self.dailyForcastArray = []
                for day in 1...dailyDataArray.count-1 {
                    let maxTemp = json["daily"]["data"][day]["temperatureHigh"].doubleValue
                    let minTemp = json["daily"]["data"][day]["temperatureLow"].doubleValue
                    let dateValue = json["daily"]["data"][day]["time"].doubleValue
                    let icon = json["daily"]["data"][day]["icon"].stringValue
                    let dailySummary = json["daily"]["data"][day]["summary"].stringValue
                    let newDailyForcast = DailyForcast(dailyMaxTemp: maxTemp, dailyMinTemp: minTemp, dailySummary: dailySummary, dailyDate: dateValue, dailyIcon: icon)
                    self.dailyForcastArray.append(newDailyForcast)
                }
                
                let hourlyDataArray = json["hourly"]["data"]
                self.hourlyForcastArray = []
                for hour in 1...hourlyDataArray.count-1 {
                    let hourlyTime = json["hourly"]["data"][hour]["time"].doubleValue
                    let hourlyTemperature = json["hourly"]["data"][hour]["temperature"].doubleValue
                    let hourlyPrecipProb = json["hourly"]["data"][hour]["precipProbability"].doubleValue
                    let hourlyIcon = json["hourly"]["data"][hour]["icon"].stringValue
                    let newHourlyForcast = HourlyForcast(hourlyTime: hourlyTime, hourlyTemperature: hourlyTemperature, hourlyIcon: hourlyIcon, hourlyPrecipProp: hourlyPrecipProb)
                    self.hourlyForcastArray.append(newHourlyForcast)
                }
   
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
