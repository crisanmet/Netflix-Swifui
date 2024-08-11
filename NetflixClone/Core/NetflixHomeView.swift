//
//  NetflixHomeView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 23/07/2024.
//

import SwiftUI

struct NetflixHomeView: View {
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ZStack {

                LinearGradient(
                    colors: [
                        .netflixDarkRed.opacity(1),
                        .netflixDarkRed.opacity(0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            }
            .frame(maxHeight: max(10, (400 + (scrollOffset * 0.75))))
            .opacity(scrollOffset < -250 ? 0 : 1)
            .animation(.easeInOut, value: scrollOffset)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    NetflixHeroView()
                        .padding()
                    
                    ScrollView(.horizontal) {
                    
                        VStack(alignment: .leading) {
                            Text("Movies")
                                .font(.headline)
                            HStack {
                                ForEach(0..<20) { index in
                                    NetflixMovieView(isRecentlyAdded: index % 2 == 0)
                                }
                            }
                        }
                        .padding()
                    
                    }
                    
                    ScrollView(.horizontal) {
                        
                        VStack(alignment: .leading) {
                            Text("Las 10 series mas vistas")
                                .font(.headline)
                            HStack {
                                ForEach(0..<10) { index in
                                    NetflixMovieView(isRecentlyAdded: index % 2 == 0, topTenRanking: index + 1)
                                }
                            }
                        }
                        .padding()
                        
                    }
                }
                .readingFrame { frame in
                    withAnimation {
                        scrollOffset = frame.minY
                    }
                }
            }
            
            VStack(spacing: 0) {
                header
                
                NetflixFilterBarView(selectedFilter: selectedFilter, onXMarkpressed: {
                    selectedFilter = nil
                }, onFilterPressed: { newFilter in
                    selectedFilter = newFilter
                }, filters: filters)
                .opacity(scrollOffset > 50 ? 1 : 0)
                .animation(.easeInOut, value: scrollOffset)
                .padding(.top, 16)
            }
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("Para Cris")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
        .animation(.easeInOut(duration: 0.5), value: scrollOffset)
        .padding([.leading, .trailing], scrollOffset > 1 ? 0 : 10)
        .background(
            VisualEffectBlur(blurStyle: .dark)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity)
                .opacity(scrollOffset > 1 ? 0 : 1)
        )
    }
}

#Preview {
    NetflixHomeView()
}


