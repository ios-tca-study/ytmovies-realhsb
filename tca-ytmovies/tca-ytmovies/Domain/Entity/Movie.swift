//
//  Movie.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import Foundation

struct MovieModel: Codable, Equatable {
    let status: String?
    let statusMessage: String?
    let data: MovieData?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusMessage = "status_message"
        case data = "data"
    }
}

struct MovieData: Codable, Equatable {
    let movieCount: Int?
    let limit: Int?
    let pageNumber: Int?
    let movies: [Movie]?

    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit = "limit"
        case pageNumber = "page_number"
        case movies = "movies"
    }
}

struct Movie: Codable, Equatable, Identifiable {
    let uuid = UUID().uuidString
    let id: Int?
    let url: String?
    let title: String?
    let year: Int?
    let rating: Double?
    let genres: [String]?
    let summary: String?
    let descriptionFull: String?
    let largeCoverImage: String?

    enum CodingKeys: String, CodingKey {
        case uuid
        case id = "id"
        case url = "url"
        case title = "title"
        case year = "year"
        case rating = "rating"
        case genres = "genres"
        case summary = "summary"
        case descriptionFull = "description_full"
        case largeCoverImage = "large_cover_image"
    }
}

extension Movie {
    static var stub01: Movie = .init(id: 1, url: "", title: "", year: 2000, rating: 0.0, genres: [], summary: "", descriptionFull: "", largeCoverImage: "")
}
