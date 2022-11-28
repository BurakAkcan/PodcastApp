//
//  Tableview+Extension.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 25.11.2022.
//

import UIKit

extension UITableView {
    func reloadTableViewOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
