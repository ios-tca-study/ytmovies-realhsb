//
//  SearchMovieUseCase.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/13/24.
//

import Foundation

struct SearchMovieUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    /// keyword 및 genre 기반 검색
    public func execute(
        limit: Int?,
        genre: GenreType?,
        keyword: String?
    
    ) async throws -> [Movie] {
        let movies = try await repository.fetchMovies(sort: nil, limit: limit, genre: genre, keyword: keyword)
        return movies
    }
}
