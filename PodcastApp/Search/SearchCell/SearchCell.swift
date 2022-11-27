//
//  SearchCell.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 23.11.2022.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {
    
    static let identifier = String(describing: SearchCell.self)
    
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func setCell(_ item: ItuneResult) {
        artistLabel.text = item.artistName
        trackLabel.text = item.trackName
        episodeLabel.text = "\(item.trackCount) episodes "
    
        if let imageUrl = URL(string: item.artworkUrl100) {
            searchImageView.kf.setImage(with: imageUrl)
        }
        
    }
    
}
