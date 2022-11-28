//
//  PlayerView.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 27.11.2022.
//

import UIKit
import Kingfisher
import AVKit

class PlayerView: UIView {
    
    //MARK: - Propeties
    
    let player: AVPlayer = {
        let avp = AVPlayer()
        avp.automaticallyWaitsToMinimizeStalling = false
        return avp
    }()
    
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let time = CMTimeMake(value: 1, timescale: 3)
        let times = [NSValue(time: time)]
        player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
            print("episode play podcast")
            
        }
    }
    
    var episode: Episode? {
        didSet{
            episodeTitle.text = episode?.title
            authorLabel.text =  episode?.author
            
            if let episode = episode,
               let url = URL(string: episode.imageUrls){
                iconImageView.kf.setImage(with: url)
            }
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!{
        didSet {
            self.iconImageView.layer.cornerRadius = 16
            iconImageView.clipsToBounds = true
            let scale: CGFloat = 0.7
            iconImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    @IBOutlet weak var episodeTitle: UILabel!{
        didSet{
            episodeTitle.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            let font = UIFont.systemFont(ofSize: 20)
            let config = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "gobackward.15",withConfiguration: config)
            backButton.setImage(image, for: .normal)
            backButton.setTitle("", for: .normal)
            backButton.addTarget(self, action: #selector(goBackClick), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var playButton: UIButton!{
        didSet{
            
            let font = UIFont.systemFont(ofSize: 40)
            let config = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "play.fill",withConfiguration: config)
            playButton.setImage(image, for: .normal)
            playButton.setTitle("", for: .normal)
            playButton.addTarget(self, action: #selector(playClicked), for: .touchUpInside)
            
        }
    }
    
    
    @IBOutlet weak var forwardButton: UIButton! {
        didSet{
            let font = UIFont.systemFont(ofSize: 20)
            let config = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "goforward.15",withConfiguration: config)
            forwardButton.setImage(image, for: .normal)
            forwardButton.setTitle("", for: .normal)
            forwardButton.addTarget(self, action: #selector(goForwardClick), for: .touchUpInside)
        }
    }
    
   //MARK: - Methods
    
    @IBAction func dismissButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @objc private func playClicked() {
        if player.timeControlStatus == .playing {
            player.pause()
            let font = UIFont.systemFont(ofSize: 40)
            let config = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "play.fill",withConfiguration: config)
            playButton.setImage(image, for: .normal)
            let scale: CGFloat = 0.7
            iconImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            
        }
        else {
            guard let url = URL(string: episode?.streamUrl ?? "") else { return }
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
            let font = UIFont.systemFont(ofSize: 40)
            let config = UIImage.SymbolConfiguration(font: font)
            let image = UIImage(systemName: "pause.fill",withConfiguration: config)
            playButton.setImage(image, for: .normal)
            UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.iconImageView.transform = .identity
            }
        }
    }
    
    @objc private func goBackClick() {
        
    }
    
    @objc private func goForwardClick() {
        
    }
}

