//
//  ArticleDetailView.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                if !article.byline.isEmpty {
                    Text(article.byline)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(article.publishedDate)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text(article.abstract)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
