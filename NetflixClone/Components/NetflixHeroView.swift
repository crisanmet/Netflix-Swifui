//
//  NetflixHeroView.swift
//  NetflixClone
//
//  Created by Cristian Sancricca on 23/07/2024.
//

import SwiftUI

struct NetflixHeroView: View {
    
    var imageName: String = ""
    var isNetflixFilm: Bool = false
    var title = "Players"
    var categories = ["Comedia", "Romantic"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NetflixHeroView()
}
