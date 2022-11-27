//
//  PlayerView.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 27.11.2022.
//

import UIKit
import Kingfisher

class PlayerView: UIView {
    
    var episode: Episode? {
        didSet{
            episodeTitle.text = episode?.title
            
            if let episode = episode,
               let url = URL(string: episode.imageUrls){
                iconImageView.kf.setImage(with: url)
            }
        }
    }

    @IBOutlet weak var iconImageView: UIImageView!{
        didSet {
            self.iconImageView.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var episodeTitle: UILabel!{
        didSet{
            episodeTitle.numberOfLines = 2
        }
    }
    
    
    
    
    @IBAction func dismissButton(_ sender: Any) {
        self.removeFromSuperview()
    }
}
