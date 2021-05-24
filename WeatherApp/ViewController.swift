//
//  ViewController.swift
//  WeatherApp
//
//  Created by David Amunga on 24/05/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var tempLabel:UILabel!
    
    private var webService:Webservice = Webservice()
    private var cancellable:AnyCancellable?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.cancellable = self.webService.fetchWeather(city: "Houston")
            .catch { _ in Just(Weather.placeholder)}
            .map { weather in
                if let temp = weather.temp{
                    return "\(temp)℉"
                }else{
                    return "Error getting weather"
                }
            }
            .assign(to:\.text,on:self.tempLabel)
    }


}

