//
//  FeedDetails.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/21/21.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct FeedDetails: View {
    
    var article:Article
    
    var body: some View {
        VStack {
            if let imgUrl = article.image, let url = URL(string: imgUrl) {

                WebImage(url: url)
                 .resizable()
                 .placeholder(Image(systemName: "photo.fill"))
                .frame(width: 300, height: 300)
                 .cornerRadius(10)
                 .aspectRatio(contentMode: .fit)
            }else {
                PlaceholderImageView()
            }
            
            Text(article.title ?? "")

            
            Spacer()
            
            Text(article.source ?? "")
            
        }.navigationTitle(article.source ?? "")
    }
}

struct FeedDetails_Previews: PreviewProvider {
    static var previews: some View {
        FeedDetails(article: Article.dummyData.first!)
    }
}
