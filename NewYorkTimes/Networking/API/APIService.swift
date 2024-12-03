//
//  APIService.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import Foundation

class APIService {
    static let shared = APIService()
    private init() {}

    func fetchMostPopular(
        path: PopularArticlesPath,
        timePeriod: Int
    ) async throws -> ArticlesResponse {
        let endpoint = APIEndpoint.mostPopular(path: path.rawValue, timePeriod: timePeriod).url
        return try await NetworkLayer.shared.request(
            endpoint: endpoint,
            method: .GET,
            responseType: ArticlesResponse.self
        )
    }
}
