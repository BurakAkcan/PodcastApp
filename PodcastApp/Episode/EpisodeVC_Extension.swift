//
//  EpisodeVC_Extension.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 24.11.2022.
//

import UIKit

extension EpisodeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = episodeList[indexPath.row]
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let playerView = Bundle.main.loadNibNamed("PlayerView", owner: self, options: nil)?.first as! PlayerView
        playerView.frame = view.frame
        playerView.episode = episode
        window?.addSubview(playerView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeCell
        else { return UITableViewCell() }
        let item = episodeList[indexPath.item]
        cell.setCell(item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .sHeight*0.14
    }
    
    
}
