//
//  Constants.swift
//  WeatherApp
//
//  Created by David Amunga on 24/05/2021.
//

import Foundation


struct Constants{
    struct URLs{
        
        static func weather(city:String)->String{
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appId=3a777a8458b770ef071b32657fa48af5&units=imperial"
        }
       
        
    }
}
