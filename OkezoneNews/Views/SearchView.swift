//
//  SearchView.swift
//  OkezoneNews
//
//  Created by DDL13 on 16/08/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var newsVM = NewsFetch()
    
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            if newsVM.searchText.isEmpty {
                VStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Temukan berita pilihanmu")
                        .foregroundColor(.secondary)
                        .navigationTitle("Search")
                }
            } else {
                List(newsVM.searchNews) { newsItem in
                    NavigationLink(destination: NewsDetailView(news: newsItem)) {
                        NewsRowView(news: newsItem)
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Okezone News")
                .refreshable {
                    await newsVM.fetchNews()
                    
                }
            }
        }
        .searchable(text: $newsVM.searchText, prompt: "Look for something")
        .task {
            await newsVM.fetchNews()
        }
        
    }
}
    
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
    
