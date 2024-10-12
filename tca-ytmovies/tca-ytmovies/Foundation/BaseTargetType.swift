//
//  BaseTargetType.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    public var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
}
