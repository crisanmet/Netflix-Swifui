//
//  NetflixFilterView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 23/07/2024.
//

import SwiftUI

struct NetflixFilterView: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = false
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            NetflixFilterView(isDropdown: true)
            NetflixFilterView(isSelected: true)
            NetflixFilterView()
        }
     
    }
}
