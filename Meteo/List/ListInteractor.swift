//
//  ListInteractor.swift
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

protocol ListBusinessLogic {
    func fetchCurrentForecasts(request: List.Forecasts.Request)
}

protocol ListDataStore {
    var name: String { get set }
}

class ListInteractor: ListBusinessLogic, ListDataStore {
    var name: String = ""

    var presenter: ListPresentationLogic?
    var worker: ListWorker?

    func fetchCurrentForecasts(request: List.Forecasts.Request)  {
        worker = ListWorker(weatherForecastsStore: OpenWeatherAPI())

        let dispatchGroup = DispatchGroup() // TODO: Create wrapping method in API to handle requesting several cities (i.e. move dispatch to API)

        var forecasts = [String: ForecastItem]()
        request.cities.forEach { city in
            dispatchGroup.enter()

            worker?.fetchCurrentForecasts(for: city) { forecast, error in
                guard let forecast = forecast else { return }

                forecasts[city] = forecast
                dispatchGroup.leave()
            }
        }

        dispatchGroup.notify(queue: .main) { [weak self] in
            let response = List.Forecasts.Response(forecasts: forecasts)
            self?.presenter?.presentFetchedForecasts(response: response)
        }
    }
}
