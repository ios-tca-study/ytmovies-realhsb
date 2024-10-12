//
//  MovieRepository.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/11/24.
//

import Foundation
import Moya

struct MovieRepository: MovieRepositoryProtocol {
    let provider: MoyaProvider<MovieService>
    
    let decoder = JSONDecoder()
    
    init(provider: MoyaProvider<MovieService>) {
        self.provider = provider
    }
}

extension MovieRepository {
    
    func fetchMovies(sort: String?, limit: Int?) async throws -> [Movie] {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.fetchMovies(sort: sort, limit: limit)) { result in
                switch result {
                case .success(let response):
                    
                    do {
                        let movieResponseObject = try decoder.decode(MovieResponseObject.self, from: response.data)
                        let movies = movieResponseObject.data?.movies?.map { $0.toModel() }
                        continuation.resume(returning: movies ?? [])
                        
                        print(movies)
                        print("영화 조회 성공")
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
                
            }
        }
        
//        return try await withCheckedThrowingContinuation { continuation in
//              service.request(.fetchMovie(limit: limit, page: page, term: term, genre: genre, sortBy: sortBy)) { result in
//                switch result {
//                case .success(let response):
//                  do {
//                    let movieResponseDTO = try JSONDecoder().decode(MovieResponseDTO.self, from: response.data)
//                    let movies = movieResponseDTO.data.movies?.map { $0.toDomain() }
//                    continuation.resume(returning: movies ?? [])
//                  } catch {
//                    continuation.resume(throwing: error)
//                  }
//                  
//                case .failure(let error):
//                  continuation.resume(throwing: error)
//                }
//              }
//            }
    }
}
