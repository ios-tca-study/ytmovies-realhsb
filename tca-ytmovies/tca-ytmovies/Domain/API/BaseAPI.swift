//
//  BaseAPI.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Foundation

public enum BaseAPI: String {
    case base
    
    public var apiDesc: String {
        switch self {
        case .base:
            return "https://yts.mx/api/v2/list_movies.json"
        }
    }
}
