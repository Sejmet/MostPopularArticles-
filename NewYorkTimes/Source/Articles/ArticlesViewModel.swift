//
//  ArticlesViewModel.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import Foundation
import Combine

class ArticlesViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var errorMessage: String?
    @Published var selectedArticle: Article?
    
    func fetchArticles(path: PopularArticlesPath, timePeriod: Int) {
        Task {
            do {
                let articlesResponse = try await APIService.shared.fetchMostPopular(path: path, timePeriod: timePeriod)
                DispatchQueue.main.async {
                    self.articles = articlesResponse.results
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func selectArticle(_ article: Article) {
        selectedArticle = article
    }
}
