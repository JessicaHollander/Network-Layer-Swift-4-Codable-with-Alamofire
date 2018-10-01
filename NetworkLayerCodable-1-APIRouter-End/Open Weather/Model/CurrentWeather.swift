//
//  CurrentWeather.swift
//  Open Weather
//
//  Created by Jessica Hollander on 01/10/18.
//  Copyright © 2018 jess. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable{
    var main: Main
    var name: String
}

struct Main: Codable{
    var temp: Float
    var pressure: Float
    var humidity: Float
    var tempMin: Float
    var tempMax:Float
}

extension Main{
    enum CodingKeys: String, CodingKey{
        case temp
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
