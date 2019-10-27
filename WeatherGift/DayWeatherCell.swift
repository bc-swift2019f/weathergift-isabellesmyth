//
//  DayWeatherCell.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/27/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class DayWeatherCell: UITableViewCell {

    @IBOutlet weak var dayCellIcon: UIImageView!
    @IBOutlet weak var dayCellWeekday: UILabel!
    @IBOutlet weak var dayCellMaxTemp: UILabel!
    @IBOutlet weak var dayCellMinTemp: UILabel!
    @IBOutlet weak var dayCellSummary: UITextView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

    func update(with dailyForcast: WeatherLocation.DailyForcast, timeZone: String) {
        dayCellIcon.image = UIImage(named: dailyForcast.dailyIcon)
        dayCellSummary.text = dailyForcast.dailySummary
        dayCellMaxTemp.text = String(format: "%2.f", dailyForcast.dailyMaxTemp) + "°"
        dayCellMinTemp.text = String(format: "%2.f", dailyForcast.dailyMinTemp) + "°"
        let usableDate = Date(timeIntervalSince1970: dailyForcast.dailyDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        dateFormatter.timeZone = TimeZone(identifier: timeZone )
        let dateString = dateFormatter.string(from: usableDate)
        dayCellWeekday.text = dateString
    }
}
