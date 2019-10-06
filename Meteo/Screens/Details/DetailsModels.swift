//
//  DetailsModels.swift
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

enum Details {
    // MARK: Use cases

    enum Forecasts {
        struct Request {
            var city: String
        }

        struct Response {
            var forecasts: ForecastItemsList
        }

        struct ViewModel {
            struct DisplayedForecast {
                var day: String?
                var weather: String?
                var temperature: String

                var description: String {
                    return String(format: "%@: %@ (%@)", day ?? "", weather ?? "", temperature)
                }

                init(forecast: ForecastItem) {
                    self.day = forecast.dt_txt?.formatedDate
                    self.weather = forecast.weather.first?.description.capitalized
                    self.temperature = String(format: "%.0f°C", forecast.main.celsius.currentTemp)
                }
            }

            var displayedForecasts: [DisplayedForecast]
        }
    }
}
