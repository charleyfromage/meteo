//
//  ListWorker.swift
//  Meteo
//
//  Created by Fromage Charley on 05/10/2019.
//  Copyright (c) 2019 Fromage Charley. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import OpenWeatherMapKit

class ListWorker {
    var weatherForecastsStore: ForecastsStoreProtocol

    init(weatherForecastsStore: ForecastsStoreProtocol) {
      self.weatherForecastsStore = weatherForecastsStore
    }

    func fetchCurrentForecasts(for city: String, completionHandler: @escaping (ForecastItem?, Error?) -> Void) {
        weatherForecastsStore.fetchCurrentForecast(for: city) { forecast, error in
            completionHandler(forecast, error)
        }
    }
}

// MARK: - Orders store API

protocol ForecastsStoreProtocol {
    func fetchCurrentForecast(for city: String, completionHandler: @escaping (ForecastItem?, Error?) -> Void)
    func fetchWeekForecast(for city: String, completionHandler: @escaping (ForecastItemsList?, Error?) -> Void)
}
