//
//  NetflixFilterBarView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 23/07/2024.
//

import SwiftUI

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockArray: [FilterModel] {
        [ .init(title: "TV Shows", isDropdown: false),
          .init(title: "Movies", isDropdown: false),
          .init(title: "Categories", isDropdown: true)
        ]
    }
}

struct NetflixFilterBarView: View {
    
    var selectedFilter: FilterModel? = nil
    var onXMarkpressed: () -> Void
    var onFilterPressed: (FilterModel) -> Void
    var filters: [FilterModel] = FilterModel.mockArray
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(.netflixLightGray)
                        .onTapGesture {
                            onXMarkpressed()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                }
          
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterView(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .onTapGesture {
                            onFilterPressed(filter)
                        }
                        .sensoryFeedback(.impact, trigger: selectedFilter)
                        .padding(.leading, ((selectedFilter == nil) && filter == filters.first) ? 16 : 0)
                    }
                 
                }
                
            }
            .padding(.vertical, 4)
        
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixFilterBarView(onXMarkpressed: { }, onFilterPressed: {_ in})
    }
}
