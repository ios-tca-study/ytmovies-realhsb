//
//  SearchView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("search", text: $searchText)
                    .textFieldStyle(SearchTextFieldStyle())
                contentView
            }
            .padding(.horizontal, 16)
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
    SearchView()
}
