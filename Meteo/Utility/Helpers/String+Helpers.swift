//
//  String+Helpers.swift
//  Meteo
//
//  Created by Fromage Charley on 06/10/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import Foundation

extension String {
    var formatedDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DateFormats.apiFormat

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = Constants.DateFormats.frenchDateFormat
            return dateFormatter.string(from: date)
        }

        return nil
    }
}
