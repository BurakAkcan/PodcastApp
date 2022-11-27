//
//  ITune.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 21.11.2022.
//

import Foundation

// MARK: - ITune
struct ITuneResponse: Codable {
    let resultCount: Int
    let results: [ItuneResult]
}




