//
//  BookmarkView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct BookmarksView: View {
    var body: some View {
        ScrollView {
            contentView
        }
    }
    
    var contentView: some View {
        VStack {
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
            MovieContentCellView(movie: .stub01)
        }
    }
}

#Preview {
    BookmarksView()
}
