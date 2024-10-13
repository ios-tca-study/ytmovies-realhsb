//
//  LatestMovieUseCase.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/12/24.
//

import Foundation

struct LatestMovieUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    /// 최신 영화 1편 조회
    public func execute() async throws -> Movie? {
        let latestMovie = try await repository.fetchMovies(sort: "", limit: 1).first
        return latestMovie
    }
}
