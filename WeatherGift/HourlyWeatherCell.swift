//
//  HourlyWeatherCell.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/27/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha"
  
    return dateFormatter
}()
class HourlyWeatherCell: UICollectionViewCell {
    @IBOutlet weak var hourlyTime: UILabel!
    @IBOutlet weak var hourlyPrecipProb: UILabel!
    @IBOutlet weak var hourlyTemp: UILabel!
    @IBOutlet weak var raindropImage: UIImageView!
    @IBOutlet weak var hourlyIcon: UIImageView!
    
    func update(with hourlyForcast: WeatherLocation.HourlyForcast, timeZone: String){
        hourlyTemp.text = String(format: "%2.f", hourlyForcast.hourlyTemperature) + "°"
        hourlyIcon.image = UIImage(named:"small-" + hourlyForcast.hourlyIcon)
        let precipProb = hourlyForcast.hourlyPrecipProp * 100
  
        let isHidden = precipProb < 30.0
        hourlyPrecipProb.isHidden = isHidden
        raindropImage.isHidden = isHidden
        hourlyPrecipProb.text = String(format: "%2.f", precipProb) + "%"
        let dateString = hourlyForcast.hourlyTime.format(timeZone: timeZone, dateFormatter: dateFormatter)
        hourlyTime.text = dateString
    }
}
