//
//  ArticlesView.swift
//  NewYorkTimes
//
//  Created by Belen on 03/12/2024.
//

import SwiftUI

struct ArticlesView: View {
    @StateObject private var viewModel = ArticlesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.articles, id: \.id) { article in
                NavigationLink(
                    destination: ArticleDetailView(article: article)
                ) {
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.abstract)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                }
            }
            .navigationTitle("Popular Articles")
            .onAppear {
                viewModel.fetchArticles(path: .emailed, timePeriod: 7)
            }
            .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? ""),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}


#Preview {
    ArticlesView()
}
