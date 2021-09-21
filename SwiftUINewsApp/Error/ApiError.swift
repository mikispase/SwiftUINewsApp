//
//  ApiError.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation

enum ApiError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case.decodingError:
            return  "Failded to decode the object from service"
        case .errorCode(let code):
           return "\(code) -Something went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
