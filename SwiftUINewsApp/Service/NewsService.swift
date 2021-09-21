//
//  NewsService.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint:NewsApi) -> AnyPublisher<NewsResponse,ApiError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsApi) -> AnyPublisher<NewsResponse, ApiError> {
        
        return URLSession.shared.dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in ApiError.unknown }
            .flatMap{data,responce -> AnyPublisher<NewsResponse,ApiError> in
                guard let responce = responce as? HTTPURLResponse else {
                    return Fail(error: ApiError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(responce.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data).decode(type: NewsResponse.self, decoder: jsonDecoder)
                        .mapError { _ in ApiError.decodingError}
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: ApiError.errorCode(responce.statusCode)).eraseToAnyPublisher()
                    
                }
             }
            .eraseToAnyPublisher()
    }
}
