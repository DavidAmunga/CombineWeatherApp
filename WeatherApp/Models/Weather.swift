//
//  Weather.swift
//  WeatherApp
//
//  Created by David Amunga on 24/05/2021.
//

import Foundation

struct WeatherResponse:Decodable{
    let main:Weather
    
}

struct Weather:Decodable{
    let temp:Double?
    let humidity:Double?
    
    
    static var placeholder:Weather{
        return Weather(temp:nil,humidity: nil)
    }
}
