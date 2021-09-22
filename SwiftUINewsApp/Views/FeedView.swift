//
//  HomeView.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import SwiftUI

struct FeedView: View {
    
  @StateObject var viewModel = NewsViewModelmpl(service: NewsServiceImpl())
    
    var body: some View {
        
        NavigationView {
            Group  {
                
                switch viewModel.state {
                case .failed(let error):
                    ErrorView(error: error,
                              handler: viewModel.getArticles)
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) { item in
                      
                      
                        NavigationLink(destination: FeedDetails(article: item)) {
                            ArticleView(isLoading: viewModel.isLoading, article: item)
                                     }
                        
                        
                    }
                    .navigationTitle(Text("News"))
                }
                
            }
        }
 
        .onAppear(perform: viewModel.getArticles)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
