//
//  SearchVC.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import UIKit
import Alamofire

final class SearchVC: UIViewController {
    
    //MARK: - Properties
    
    var ituneList: [ItuneResult] = []
    
    //MARK: - Outputes
    var sView = SearchView()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func loadView() {
        super.loadView()
        view = sView
        setTableView()
        setSearchBar()
    }
    
    //MARK: - Setup work
    private func setTableView() {
        sView.tableView.delegate = self
        sView.tableView.dataSource = self
    }
    
    private func setSearchBar() {
        self.definesPresentationContext = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        navigationItem.title = "Search"
        navigationItem.searchController = searchController
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
     func reloadTableView() {
         self.sView.tableView.reloadTableViewOnMainThread()
    }
}
