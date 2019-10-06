//
//  ListRouter.swift
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

@objc protocol ListRoutingLogic {
    func routeToDetails(segue: UIStoryboardSegue?)
}

protocol ListDataPassing {
    var dataStore: ListDataStore? { get set }
}

class ListRouter: NSObject, ListRoutingLogic, ListDataPassing {
    weak var viewController: ListViewController?
    var dataStore: ListDataStore?

    enum Routes {
        static let pushDetails = "Details"
    }

    // MARK: Routing

    func routeToDetails(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! DetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDetails(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Details", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDetails(source: dataStore!, destination: &destinationDS)
            navigateToDetails(source: viewController!, destination: destinationVC)
        }
    }

    // MARK: Navigation

    func navigateToDetails(source: ListViewController, destination: DetailsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK: Passing data

    func passDataToDetails(source: ListDataStore, destination: inout DetailsDataStore) {
        if let selectedCity = source.selectedCity {
            destination.city = selectedCity
        }
    }
}
