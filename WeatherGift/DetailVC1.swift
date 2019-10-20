//
//  DetailVC1.swift
//  WeatherGift
//
//  Created by Isabelle Smyth on 10/14/19.
//  Copyright © 2019 Isabelle Smyth. All rights reserved.
//

import UIKit

class DetailVC1: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
    var currentPage = 0
    var locationsArray = [WeatherLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = locationsArray[currentPage].name
        
     
    }
    

  

}
