//
//  MainTabView.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/22/24.
//

import SwiftUI
import Moya
import ComposableArchitecture

struct MainTabView: View {
    
    @State private var selectedTab: MainTabType = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(MainTabType.allCases, id: \.self) { tab in
                Group {
                    switch tab {
                    case .home:
                        // TODO: - 초기화시 주입 방식 수정하기
                        let provider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
                        let repository = MovieRepository(provider: provider)
                        let topFiveMoviesUseCase = TopFiveMovieUseCase(repository: repository)
                        let latestMovieUseCase = LatestMovieUseCase(repository: repository)
                        let store = Store(initialState: HomeFeature.State()) {
                            HomeFeature(topFiveMovieUseCase: topFiveMoviesUseCase, latestMovieUseCase: latestMovieUseCase)
                        }
                        HomeView(store: store)
                        
                    case .search:
                        let provider = MoyaProvider<MovieService>(plugins: [MoyaLoggingPlugin()])
                        let repository = MovieRepository(provider: provider)
                        let searchMovieUseCase = SearchMovieUseCase(repository: repository)

                        let store = Store(initialState: SearchFeature.State()) {
                            SearchFeature(searchMovieUseCase: searchMovieUseCase)
                        }
                        SearchView(store: store)
                    case .bookmark:
                        BookmarksView()
                    }
                }
                .tabItem {
                    Image(systemName: "camera")
                }
                .tag(tab)
            }
        }
    }
}

#Preview {
    MainTabView()
}
