//
//  IServiceRouter.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 22.11.2022.
//

import Foundation
import Alamofire

protocol IServiceRouter: URLRequestConvertible {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var paramaters: Parameters? { get }
}

