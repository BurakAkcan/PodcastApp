//
//  EpisodeController.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 24.11.2022.
//

import UIKit
import FeedKit

final class EpisodeController: UIViewController {
    
    //MARK: - Properties
    
    var episodeList = [Episode]()
    
    var itune: ItuneResult? {
        didSet {
            self.title = itune?.trackName
           
        }
    }
    
    //MARK: - Outputs
    
    var sView = EpisodeView()

    override func loadView() {
        super.loadView()
        view = sView
        setTabbleView()
        fetchFeed()
        
    }
    
    //MARK: - Methods
    
    private func setTabbleView() {
        sView.tableView.delegate = self
        sView.tableView.dataSource = self
    }
    
    func fetchFeed() {
        NetworkManager.shared.fetchEpisode(feedUrl: Constants.episodeUrl) { [weak self] (result) in
            guard let self = self else { return }
            self.episodeList = result
            self.sView.tableView.reloadTableViewOnMainThread()
            
        }
    }

}
