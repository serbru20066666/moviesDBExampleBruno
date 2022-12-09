//
//  SwiftUIView.swift
//  testMovies
//
//  Created by Bruno Cardenas on 26/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct movieCard: View {
    
    var movie:Movie
    var body: some View {
        
        
        VStack(alignment:.leading,spacing: 10)
        {
            NavigationLink(destination: movieDetail(movie: movie)
                            ) {
                WebImage(url: URL(string: Constants.urlImage.replacingOccurrences(of: "imagePARAM", with: (movie.poster_path ?? "")) ))
                    .onSuccess { image, data, cacheType in
                        
                    }
                    .resizable().frame(height: 170).aspectRatio(contentMode: .fill)
            }
            Text(movie.title ?? "").foregroundColor(Constants.greenApp).font(.subheadline).padding(.leading,8)
            HStack()
            {
                Text(movie.release_date ?? "").foregroundColor(Constants.greenApp).font(.subheadline)
                Spacer()
                Text("✦" + String(format: "%.1f", movie.popularity ?? 0.0)).foregroundColor(Constants.greenApp).font(.subheadline).padding(.trailing,8)
                
            }.padding(.leading,8)
            Text(movie.overview ?? "").font(.system(size: 9)).foregroundColor(.white).padding(.leading,8)
            Spacer(minLength: 20)
        }.background(Constants.grayApp).cornerRadius(20)
        
    }
}

struct movieCard_Previews: PreviewProvider {
    static var previews: some View {
        movieCard(movie: Movie(adult: nil, backdropPath: nil, genreIDS: nil, id: nil, originalLanguage: nil, originalTitle: nil, overview: nil, popularity: nil, poster_path: nil, release_date: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    }
}
