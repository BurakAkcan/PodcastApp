//
//  EpisodeCell.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 25.11.2022.
//

import UIKit
import Kingfisher

final class EpisodeCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
    
    public func setCell(_ item: Episode) {
        // add some
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        dateLabel.text = dateFormatter.string(from: item.pubDate)
        print(item.imageUrls)
        if let urlImage = URL(string: item.imageUrls) {
            episodeImageView.kf.setImage(with: urlImage)
        } else {
            episodeImageView.image = #imageLiteral(resourceName: "appicon ")
        }
       
    }
    
}
