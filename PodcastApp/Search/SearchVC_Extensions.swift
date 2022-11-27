//
//  SearchVC_Extensions.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import Foundation
import UIKit
import Alamofire

//MARK: - Extension for table view
extension SearchVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = ituneList[indexPath.item]
        let episodeVC = EpisodeController()
        episodeVC.itune = item
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ituneList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
            return UITableViewCell()
        }
        let item = ituneList[indexPath.item]
        cell.setCell(item)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .sHeight * 0.13
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let lbl = UILabel()
         lbl.textAlignment = .center
         lbl.font = .boldSystemFont(ofSize: 20)
         lbl.textColor = .systemGray2
         lbl.text = "Please enter a search term"
         return lbl
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        ituneList.count > 0 ? 0 : sView.frame.size.height/2
    }
 
}
//MARK: - Extension for search controller
extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            NetworkManager.shared.request(with: SearchRouter.search(term: searchText), responseObjectType: ITuneResponse.self, encoding: JSONEncoding.default) { [weak self] response in
                guard let self = self else { return }
                if let itunes = response?.results {
                    self.ituneList = itunes
                }
                self.sView.tableView.reloadTableViewOnMainThread()
            } failure: { error in
                print(error)
                self.ituneList = []
            }
            
        }
    }
}
