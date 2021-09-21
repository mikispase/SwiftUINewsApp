//
//  NewsResponse.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable,Identifiable, Equatable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}

extension Article {
    static var dummyData:[Article] {
        [
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
            .init(author: "Ian Austen",
                  url: "https://www.nytimes.com/live/2021/09/20/world/canada-election-2021",
                  source: "New York Times",
                  title: "Canada Election 2021 Live Updates: Will Trudeau's Gamble Pay Off? - The New York Times",
                  articleDescription: "ustin Trudeau says he needs a strong mandate to lead the nation out of the pandemic.",
                  image: "https://static01.nyt.com/images/2021/09/20/world/20CANADA-ELECTION-BRIEFING-PROMO/20CANADA-ELECTION-BRIEFING-PROMO-facebookJumbo.jpg",
                  date: Date()),
        ]
    }
}
