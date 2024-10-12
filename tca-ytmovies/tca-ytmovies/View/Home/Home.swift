//
//  Home.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Foundation
import Combine
import ComposableArchitecture

struct Home: Reducer {
    public init() {}
    
    struct State: Equatable {
        var movieModel: MovieModel? = nil
    }
    
    // result는 not equatable 함
    enum Action: Equatable {
        case getTopFiveMovies(Result<MovieModel, MovieError>)   // Error는 not E
    }
    
    struct Environment {
       
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .getTopFiveMovies(let result):
            return .none
        }
    }
}

enum MovieError: Equatable, Error {
    case networkError
    
    var desc: String {
        switch self {
        case .networkError:
            return ""
        }
    }
}
