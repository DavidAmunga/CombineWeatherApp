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
    @IBOutlet weak var cityTextField:UITextField!
    
    private var webService:Webservice = Webservice()
    private var cancellable:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPublishers()
        
        // Do any additional setup after loading the view.
        //        self.cancellable = self.webService.fetchWeather(city: "Houston")
        //            .catch { _ in Just(Weather.placeholder)}
        //            .map { weather in
        //                if let temp = weather.temp{
        //                    return "\(temp)℉"
        //                }else{
        //                    return "Error getting weather"
        //                }
        //            }
        //            .assign(to:\.text,on:self.tempLabel)
    }
    
    
    private func setupPublishers(){
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification,object: cityTextField)
        
        self.cancellable = publisher
            .compactMap{ ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) }
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webService.fetchWeather(city: city)
                    .catch{_ in Just(Weather.placeholder)}
                    .map{$0}
            }
            .sink {
                if let temp = $0.temp{
                    self.tempLabel.text = "\(temp)℉"
                }else{
                    self.tempLabel.text = ""
                
                }
            }
        
    }
    
}

