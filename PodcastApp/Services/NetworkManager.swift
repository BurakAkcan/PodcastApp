//
//  NetworkManager.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import FeedKit

//https://itunes.apple.com/search?term=\(searchText)
//https://itunes.apple.com/search?term=jack+johnson

final class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
    private init () {}
    
    func request<T: Codable>(with router: IServiceRouter, responseObjectType: T.Type,encoding: ParameterEncoding, completion: @escaping (T?)->Void, failure: @escaping (AFError)->Void){
        AF.request(
            router.urlRequest?.url ?? "" ,
            method: router.method,
            parameters: router.paramaters
        ).responseData { response in
            switch response.result {
            case .success(let value):
                do{
                    let responseJsonData = JSON(value)
                    let responseModel = try JSONDecoder().decode(responseObjectType.self, from: responseJsonData.rawData())
                    completion((responseModel))
                }catch let parsingError{
                    print("Error: \(parsingError.localizedDescription)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                failure(error)
            }
        }
    }
    
    func fetchEpisode(feedUrl: String, completion: @escaping ([Episode])->Void) {
        guard let feedUrl = URL(string: feedUrl) else { return }
        
        let parser = FeedParser(URL: feedUrl)
        parser.parseAsync { (result) in
            switch result {
            case .success(let feed):
                var episodeList:[Episode] = []
                feed.rssFeed?.items?.forEach({ (feedItem) in
                    let episode = Episode(feedItem: feedItem)
                    episodeList.append(episode)
                })
                completion(episodeList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
