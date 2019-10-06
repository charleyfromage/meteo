//
//  ForecastsStoreProtocol.swift
//  Meteo
//
//  Created by Fromage Charley on 06/10/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import Foundation
import OpenWeatherMapKit

// MARK: - Store API

protocol ForecastsStoreProtocol {
    func fetchCurrentForecast(for city: String, completionHandler: @escaping (ForecastItem?, Error?) -> Void)
    func fetchWeekForecast(for city: String, completionHandler: @escaping (ForecastItemsList?, Error?) -> Void)
}
