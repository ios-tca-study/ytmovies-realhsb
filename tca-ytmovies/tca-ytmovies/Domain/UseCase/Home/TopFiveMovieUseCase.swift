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
    
    /// Top5 영화 조회
    public func execute() async throws -> [Movie] {
        let movies = try await repository.fetchMovies(sort: nil, limit: 5, genre: nil, keyword: nil)
        return movies
    }
}
