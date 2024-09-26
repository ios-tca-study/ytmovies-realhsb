//
//  Movie.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import Foundation

struct Movie {
    let id = UUID().uuidString
    let title: String?
    let rating: Double
    let genre: String?
    let content: String?
}

extension Movie {
    static public var stub01: Movie = .init(title: "movie title 01", rating: 3.4, genre: "genre01", content: "content")
}
