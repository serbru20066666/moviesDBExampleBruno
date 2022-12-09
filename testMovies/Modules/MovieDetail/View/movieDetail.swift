//
//  movieDetail.swift
//  testMovies
//
//  Created by Bruno Cardenas on 1/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct movieDetail: View {
    var movie:Movie
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        
        ZStack {
            
            VStack(alignment: .center)
            {
                
                WebImage(url: URL(string: Constants.urlImage.replacingOccurrences(of: "imagePARAM", with: (movie.poster_path ?? "")) ))
                    .onSuccess { image, data, cacheType in
                        
                    }
                    .resizable().scaledToFill().aspectRatio(contentMode: .fill).frame(height:400).frame(width: 400).clipped().padding(.top,-50)
                
                VStack(alignment: .leading)
                {
                    HStack {
                        Text("Summary").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(Constants.greenApp).padding(.leading, 30).padding(.top, 30)
                        Spacer()
                    }
                    Text(movie.title ?? "").font(.system(size: 20, weight: .bold, design: .default)).foregroundColor(Color.white).padding(.leading, 30).padding(.top, 10)
                    Text(movie.overview ?? "").font(.system(size: 15)).foregroundColor(.white).padding(.leading, 30).padding(.top, 10)
                    Spacer()
                }.frame(width:UIScreen.screenWidth - 80).background(Constants.grayApp).cornerRadius(20).padding(.top, -80)
                
            }.frame(maxWidth: .infinity).background(Color.black)            .navigationBarHidden(true)
                .edgesIgnoringSafeArea([.top, .bottom])

            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                HStack {
                    Image("backIcon").resizable().frame(width: 15,height: 15)
                    Text("Back")
                }
            }
            .padding(13)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(.infinity)
            .position(CGPoint(x: 70, y: 6))
        }
        
        
        
        
    }
}

struct movieDetail_Previews: PreviewProvider {
    static var previews: some View {
        movieDetail(movie: Movie(adult: nil, backdropPath: nil, genreIDS: nil, id: nil, originalLanguage: nil, originalTitle: "Bruno Movie", overview: "Lorem", popularity: nil, poster_path: "//gKnhEsjNefpKnUdAkn7INzIFLSu.jpg", release_date: nil, title: nil, video: nil, voteAverage: nil, voteCount: nil))
    }
}
