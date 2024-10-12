//
//  MovieObject.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/11/24.
//

struct MovieResponseObject: Codable, Equatable {
    let status: String?
    let statusMessage: String?
    let data: MovieDataObject?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case statusMessage = "status_message"
        case data = "data"
    }
}

struct MovieDataObject: Codable, Equatable {
    let movieCount: Int?
    let limit: Int?
    let pageNumber: Int?
    let movies: [MovieObject]?

    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit = "limit"
        case pageNumber = "page_number"
        case movies = "movies"
    }
}

struct MovieObject: Codable, Equatable {
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

extension MovieObject {
    func toModel() -> Movie {
        .init(id: id, url: url, title: title, year: year, rating: rating, genres: genres, summary: summary, descriptionFull: descriptionFull, largeCoverImage: largeCoverImage)
    }
}
