//
//  ResultStates.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation

enum  ResultState : Equatable{
    case loading
    case succsess(content: [Article])
    case failed(error:Error)
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs,rhs) {
        case (.loading, .loading):
            return true
        case (.failed(error: let hlsType), .failed(error:let rhsType)):
            return hlsType.localizedDescription == rhsType.localizedDescription
        case (.succsess(content: let lhsType), .succsess(content: let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
}
