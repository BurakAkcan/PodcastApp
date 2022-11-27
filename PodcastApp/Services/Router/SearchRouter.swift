//
//  ServiceRouter.swift
//  PodcastApp
//
//  Created by Burak AKCAN on 22.11.2022.
//

import Foundation
import Alamofire
 
enum SearchRouter: IServiceRouter {
    
    case search(term: String)
    
    var baseUrl: String {
        switch self {
        case .search:
            return "https://itunes.apple.com"
        }
    }
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var paramaters: Parameters? {
        switch self {
        case .search(let term):
            return ["term": term]
        }
    }
}

//MARK: - URLRequestConvrtible
extension SearchRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL().appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        if method == .get {
            request = try URLEncoding.default.encode(request, with: paramaters)
        }else if method == .post {
            request = try JSONEncoding.default.encode(request, with: paramaters)
        }
        return request
    }
}
