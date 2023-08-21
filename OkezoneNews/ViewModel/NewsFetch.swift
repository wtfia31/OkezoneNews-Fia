//
//  NewsFetch.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import Foundation

class NewsFetch: ObservableObject {
    @Published var news: [News] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var selectedCategory: String? = nil
   
    
    var uniqueCategories: [String] {
        Set(news.flatMap { $0.categories }).sorted()
    }
    
    var filteredNews: [News] {
        if let selectedCategory = selectedCategory, !selectedCategory.isEmpty {
            return news.filter { news in
                news.categories.contains(selectedCategory)
            }
        } else if !searchText.isEmpty {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            return news
        }
    }
    
    var searchNews: [News] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText) ||
                news.categories.first!.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    func fetchNews() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/okezone-news")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        News(
                            title: newsData.title,
                            link: newsData.link,
                            content: newsData.content,
                            categories: newsData.categories,
                            isoDate: newsData.isoDate,
                            image: newsData.image)
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
    
}
