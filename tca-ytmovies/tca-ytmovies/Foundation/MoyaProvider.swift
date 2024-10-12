//
//  MoyaProvider.swift
//  tca-ytmovies
//
//  Created by Subeen on 10/6/24.
//

import Moya

/// Moya 비동기 처리

extension MoyaProvider {
    func request(_ target: Target) async -> Result<Response, MoyaError> {
        await withCheckedContinuation { continuation in
            self.request(target) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
