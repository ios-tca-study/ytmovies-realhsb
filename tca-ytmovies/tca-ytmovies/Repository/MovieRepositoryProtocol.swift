//
//  MovieRepositoryProtocol.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/11/24.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchMovies(sort: String?, limit: Int?, genre: GenreType?, keyword: String?) async throws -> [Movie]
}
