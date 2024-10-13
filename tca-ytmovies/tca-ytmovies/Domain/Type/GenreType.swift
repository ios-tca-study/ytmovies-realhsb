//
//  GenreType.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/13/24.
//

import Foundation

enum GenreType: String, Codable, CaseIterable {
    case all
    case animation
    case action
    case comedy
    
    var description: String {
        switch self {
        case .all:
            "ALL"
        case .animation:
            "ANIMATION"
        case .action:
            "ACTION"
        case .comedy:
            "COMEDY"
        }
    }
}
