//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/27/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import Foundation


extension TimeInterval {
    func format(timeZone: String , dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone )
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
}
