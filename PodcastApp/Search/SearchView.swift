//
//  SearchView.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import UIKit

final class SearchView: UIView {
    //MARK: - Outputs
     let tableView: UITableView = {
         let tbv = UITableView(frame: .zero, style: .plain)
         tbv.translatesAutoresizingMaskIntoConstraints = false
         return tbv
    }()
    
    //MARK: - İnitialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        registerTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

     //MARK: - Extensions
private extension SearchView {
    
    func registerTableView() {
        let nib = UINib(nibName: "SearchCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: SearchCell.identifier)
    }
    
    func configureView() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
}
