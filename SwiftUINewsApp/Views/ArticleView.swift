//
//  ArticleView.swift
//  SwiftUINewsApp
//
//  Created by Dimitar Spasovski on 9/20/21.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ArticleView: View {
    @State  var isLoading:Bool
    let article:Article
    
    var body: some View {

        HStack {
            
            if let imgUrl = article.image, let url = URL(string: imgUrl) {

                WebImage(url: url)
                 .resizable()
                 .placeholder(Image(systemName: "photo.fill"))
                .frame(width: 80, height: 80)
                 .cornerRadius(10)
                 .aspectRatio(contentMode: .fit)
            }else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading,spacing:4){
                Text(article.title ?? "")
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 14,weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                if let date = article.date {
                    HStack {
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.system(size: 12,weight: .bold))
                        Text(date, style: .time)
                            .foregroundColor(.gray)
                            .font(.system(size: 12))


                    }
              
                }
            }
            
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
   
        

    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
           .foregroundColor(.white)
           .background(Color.gray)
           .frame(width: 80, height: 80)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading:false,
                    article: Article.dummyData.first!)
            .previewLayout(.sizeThatFits)
    }
}
