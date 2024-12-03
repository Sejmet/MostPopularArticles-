//
//  APIEndpoint.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import Foundation

enum APIEndpoint {
    case mostPopular(path: String, timePeriod: Int)
    
    var url: String {
        switch self {
        case .mostPopular(let path, let timePeriod):
            guard let apiKey = SecureStorage.shared.getFromKeychain(key: "APIKey") else {
                return ""
            }
            return "\(NYTAPIConfig.baseURL)/\(path)/\(timePeriod).json?api-key=\(apiKey)"
        }
    }
}
