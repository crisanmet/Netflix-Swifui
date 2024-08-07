//
//  NetflixHeroView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 06/08/2024.
//

import SwiftUI
import Kingfisher

struct NetflixHeroView: View {
    
    var imageName: String = "https://picsum.photos/600/600"
    var isNetflixFilm: Bool = true
    var title = "Vikings"
    var categories = ["Comedia", "Romantic"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: imageName))
                .placeholder {
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .clipped()
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    if isNetflixFilm {
                        HStack(spacing: 8) {
                            Text("N")
                                .foregroundStyle(.netflixRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            
                            Text("Movie")
                                .font(.subheadline)
                                .kerning(3)
                                .foregroundStyle(.netflixWhite)
                        }
                        
                        Text(title.uppercased())
                            .font(.system(size: 50, weight: .bold, design: .serif))
                        
                        HStack(spacing: 8) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                                    .font(.callout)
                                
                                if category != categories.last {
                                    Circle()
                                        .frame(width: 4, height: 4)
                                }
                            }
                        }
                        .padding(.bottom, 8)
                        
                        HStack(spacing: 16) {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Play")
                            }
                            .onTapGesture {
                                onPlayPressed?()
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .foregroundStyle(.netflixDarkGray)
                            .background(.netflixWhite)
                            .cornerRadius(4)
                            
                            HStack {
                                Image(systemName: "plus")
                                Text("My List")
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .foregroundStyle(.netflixWhite)
                            .background(.netflixDarkGray)
                            .cornerRadius(4)
                            .onTapGesture {
                                onMyListPressed?()
                            }
                        }
                        .font(.callout)
                        .fontWeight(.medium)
                    }
                }
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .foregroundStyle(.netflixWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .aspectRatio(0.8, contentMode: .fit)
        .onTapGesture {
            onBackgroundPressed?()
        }
    }
}

#Preview {
    NetflixHeroView()
        .padding(40)
}
