//
//  NewsViewModel.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
    var isLoading:Bool { get }
}

 
class NewsViewModelmpl: ObservableObject, NewsViewModel {
    
    private let service:NewsService
    
    private(set) var articles = [Article]()
    private var cancellables =  Set<AnyCancellable>()
    @Published  private(set) var state: ResultState = .loading
    
    var isLoading: Bool {
        state  == .loading
    }

    
    init(service:NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                
                case .finished:
                    self.state = .succsess(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { responce in
                self.articles = responce.articles
            }

        self.cancellables.insert(cancellable)
    }
    
}
