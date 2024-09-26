//
//  MainTapType.swift
//  tca-ytmovies
//
//  Created by Subeen on 9/26/24.
//

import Foundation

enum MainTabType: String, CaseIterable  {
    case home
    case search
    case bookmark
    
    var title: String {
        switch self {
        case .home:
            "home"
        case .search:
            "search"
        case .bookmark:
            "bookmark"
        }
    }
}
