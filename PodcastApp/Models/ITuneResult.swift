//
//  ITuneResult.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import Foundation


// MARK: - Result
struct ItuneResult: Codable {
    let artistID, collectionID: Int?
    let trackID: Int
    let artistName: String?
    let trackName: String?
    let artworkUrl100: String
    let trackCount: Int
    let previewUrl: String?
    let trackViewUrl: String?
    let collectionViewUrl: String?

   

    enum CodingKeys: String, CodingKey {
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName
        case trackName
        case artworkUrl100
        case trackCount
        case previewUrl
        case trackViewUrl
        case collectionViewUrl
    }
}
