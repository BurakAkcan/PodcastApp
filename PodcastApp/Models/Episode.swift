//
//  Episode.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 24.11.2022.
//

import Foundation
import FeedKit

struct Episode {
    let title: String
    let pubDate: Date
    let description: String
    let imageUrls: String
    let  author: String
    let streamUrl: String
    init(feedItem: RSSFeedItem){
        self.title = feedItem.title ?? ""
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.imageUrls = feedItem.iTunes?.iTunesImage?.attributes?.href ?? ""
        self.author =  feedItem.iTunes?.iTunesAuthor ?? "Unknown"
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
    }
}
