//
//  NewsEndpoint.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest:URLRequest { get }
    var baseURL:URL { get }
    var path:String { get }
}

enum NewsApi {
    case getNews
}

extension NewsApi : APIBuilder {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
  
   
    
    
}
