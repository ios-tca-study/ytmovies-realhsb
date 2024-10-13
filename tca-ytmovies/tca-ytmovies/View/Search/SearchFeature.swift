//
//  SearchFeature.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/13/24.
//

import Foundation
import Combine
import ComposableArchitecture

@Reducer
struct SearchFeature {
    
    let searchMovieUseCase: SearchMovieUseCase
    
    @ObservableState
    struct State: Equatable {
        var isLoading: Bool = false
        var searchMovieResult: [Movie] = []
    }

    enum Action: Equatable {
        case searchMovieUseCase(String, GenreType)
        
        // TODO: - inner action 분리하기...?
        case updateMovies([Movie])
    }
  
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .searchMovieUseCase(let keyword, let genre):
                return .run { send in
                    let response = try await searchMovieUseCase.execute(limit: 10, genre: genre, keyword: keyword)
                    await send(.updateMovies(response))
                }
                
            case .updateMovies(let response):
                state.searchMovieResult = response
                return .none
            }
        }
    }
}
