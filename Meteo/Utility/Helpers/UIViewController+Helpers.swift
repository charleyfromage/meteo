//
//  UIViewController+Helpers.swift
//  Meteo
//
//  Created by Fromage Charley on 06/10/2019.
//  Copyright © 2019 Fromage Charley. All rights reserved.
//

import UIKit

protocol UITableViewAnimation {}

extension UITableViewAnimation {
    func hideTableView(_ tableView: UITableView) {
        UIView.animate(withDuration: 0.5) { [weak tableView] in
            tableView?.alpha = 0
        }
    }

    func showTableView(_ tableView: UITableView) {
        UIView.animate(withDuration: 0.5) { [weak tableView] in
            tableView?.alpha = 1
        }
    }
}
