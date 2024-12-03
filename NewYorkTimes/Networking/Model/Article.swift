//
//  Article.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import Foundation

struct ArticlesResponse: Decodable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [Article]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct Article: Decodable {
    let id: Int
    let title: String
    let byline: String
    let publishedDate: String
    let abstract: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case byline
        case publishedDate = "published_date"
        case abstract
        case url
    }
}
