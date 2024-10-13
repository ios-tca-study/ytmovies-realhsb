//
//  HomeFeature.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Foundation
import Combine
import ComposableArchitecture

@Reducer
struct HomeFeature {
    
    let topFiveMovieUseCase: TopFiveMovieUseCase
    let latestMovieUseCase: LatestMovieUseCase
    
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
        var topFiveMovies: [Movie] = []
        var latestMovie: Movie = .stub01
    }
    
    // result는 not equatable 함
    enum Action: Equatable {
//        case loadHome
        case getTopFiveMovies
        case getLatestMovie
        
        
        // TODO: - inner action 분리하기
        case updateTopFiveMovies([Movie])
        case updateLatestMovie(Movie)
    }
    
    // TODO: DIContainer 정의하고 DependencyKey 채택하는 UseCase 만들기
//    @Dependency(TopFiveMovieUseCase.self) var topFiveMovieUseCase
//    @Dependency(LatestMovieUseCase.self) var latestMovieUseCase
  
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getTopFiveMovies:
                return .run { send in
                    let response = try await topFiveMovieUseCase.execute()
                    await send(.updateTopFiveMovies(response))
                }
            
            case .getLatestMovie:
                return .run { send in
                    let response = try await latestMovieUseCase.execute()
                    await send(.updateLatestMovie(response ?? .stub01))
                }
            case .updateTopFiveMovies(let response):
                state.topFiveMovies = response
                return .none
                
            case .updateLatestMovie(let response):
                state.latestMovie = response
                return .none
            }
        }
    }
}

enum MovieError: Equatable, Error { // Error는 not Equatable 하므로 따로 정의
    case networkError
    
    var desc: String {
        switch self {
        case .networkError:
            return ""
        }
    }
}
