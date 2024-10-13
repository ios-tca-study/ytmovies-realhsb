//
//  SearchView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    
    /// 검색 텍스트 분리하기
    @State var searchText: String = ""
    
    @Bindable var store: StoreOf<SearchFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                VStack {
                    HStack {
                        TextField("search", text: $searchText)
                            .textFieldStyle(SearchTextFieldStyle())
                        Button {
                            store.send(.searchMovieUseCase(searchText, .action))
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    contentView
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear {
            store.send(.searchMovieUseCase(searchText, .action))
        }
    }

    var contentView: some View {
        ForEach(store.searchMovieResult) { movie in
            
            VStack {
                MovieContentCellView(movie: movie)
            }
            
        }
    }
}

//#Preview {
//    SearchView()
//}
