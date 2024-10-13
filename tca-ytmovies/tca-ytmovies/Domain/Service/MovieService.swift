//
//  MovieService.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Moya

enum MovieService {
    case fetchMovies(sort: String?, limit: Int?, genre: GenreType?, keyword: String?)
    case getTopFiveMovies(sort: String?, limit: Int?)
    case getLatestMovies

}

extension MovieService: BaseTargetType {
    
    var path: String {
        switch self {
        case .fetchMovies:
            return BaseAPI.base.apiDesc
        
        case .getTopFiveMovies(_, _):
            return BaseAPI.base.apiDesc
            
        case .getLatestMovies:
            return BaseAPI.base.apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchMovies:
                .get
            
        case .getTopFiveMovies(let sort, let limit):
                .get
    
        case .getLatestMovies:
                .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchMovies(let sort, let limit, let genre, let keyword):
            
            let parameters: [String : Any] = [
                "sort": sort,
                "limit": limit,
                "genre": genre?.description ?? "",  // TODO: 옵셔널 처리
                "query_term": keyword ?? ""
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)

            
        case .getTopFiveMovies(let sort, let limit):
            let parameters: [String : Any] = [
                "sort": sort,
                "limit": limit
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        
        case .getLatestMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchMovies:
            return ["Content-type": "application/json"]
        case .getTopFiveMovies:
            return [:]
        case .getLatestMovies:
            return [:]
        }
    }
}
