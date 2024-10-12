//
//  TopFiveMovieUseCase.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/11/24.
//

import Foundation

struct TopFiveMovieUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    public func execute() async throws -> [Movie] {
        let movies = try await repository.fetchMovies(sort: "", limit: 5)
        return movies
    }
}
