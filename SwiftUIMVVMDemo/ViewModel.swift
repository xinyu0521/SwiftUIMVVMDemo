//
//  ViewModel.swift
//  SwiftUIMVVMDemo
//
//  Created by zhanx630 on 2022/5/23.
//

import Foundation

// Data needed by view

class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var cityName: String = "-"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
        guard let url = URL(string: "http://t.weather.sojson.com/api/weather/city/101020100") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
 
            // Convert data to model
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.cityName = model.cityInfo.city
                    self.descriptionText = "湿度：\(model.data.shidu) 空气质量：\(model.data.quality)"
                    self.title = model.data.ganmao
                    self.temp = "\(model.data.wendu)℃"
                }
            }
            catch {
                print("JSONDecoder Failed")
            }
        }
        
        task.resume()
    }
}
