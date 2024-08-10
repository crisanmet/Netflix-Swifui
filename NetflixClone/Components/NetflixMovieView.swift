//
//  NetflixMovieView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 07/08/2024.
//

import SwiftUI
import Kingfisher

struct NetflixMovieView: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = "https://picsum.photos/600/600"
    var title = "Movie"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int? = nil
    
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            ZStack(alignment: .bottom) {
                KFImage(URL(string: imageName))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .clipped()
                
                VStack(spacing: 0, content: {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .lineLimit(1)
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed)
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 2, topTrailingRadius: 2))
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                })
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
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixMovieView(isRecentlyAdded: false)
            NetflixMovieView(topTenRanking: 10)
            NetflixMovieView(topTenRanking: 9)
            NetflixMovieView()
            NetflixMovieView()
        }
    }
}
