//
//  OpenWeatherAPI.swift
//  Meteo
//
//  Created by Fromage Charley on 05/10/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import Foundation
import OpenWeatherMapKit

class OpenWeatherAPI: ForecastsStoreProtocol {
    func fetchCurrentForecast(for city: String, completionHandler: @escaping (ForecastItem?, Error?) -> Void) {
        OpenWeatherMapKit.instance.currentWeather(forCity: city) { forecast, error in
            completionHandler(forecast, error)
        }
    }

    func fetchWeekForecast(for city: String, completionHandler: @escaping (ForecastItemsList?, Error?) -> Void) {
        OpenWeatherMapKit.instance.weatherForecastForFiveDays(forCity: city) { forecast, error in
            completionHandler(forecast, error)
        }
    }
}
