//
//  EpisodeView.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 24.11.2022.
//

import UIKit

final class EpisodeView: UIView {
    
    let tableView: UITableView = {
        let tbv = UITableView(frame: .zero, style: .plain)
        tbv.translatesAutoresizingMaskIntoConstraints = false
        return tbv
   }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        register()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EpisodeView {
    
    func register() {
        let nib = UINib(nibName: "EpisodeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeCell")
        tableView.tableFooterView = UIView()
    }
    
    func configureView() {
        addSubview(tableView)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
