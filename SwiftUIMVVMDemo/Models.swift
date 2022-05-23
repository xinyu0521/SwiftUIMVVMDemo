//
//  Models.swift
//  SwiftUIMVVMDemo
//
//  Created by zhanx630 on 2022/5/23.
//

import Foundation

//Data
struct WeatherModel: Codable {
    let cityInfo: CityInfo
    let data: WeatherData
}

struct CityInfo: Codable {
    let city: String
    let parent: String
    let updateTime: String
}

struct WeatherData: Codable {
    let shidu: String
    let quality: String
    let wendu: String
    let ganmao: String
}
