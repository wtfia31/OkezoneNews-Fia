//
//  NewsListView.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var newsVM = NewsFetch()
    @StateObject var newsBookmark = Bookmark()
    
    var body: some View {
        NavigationStack {
            if newsVM.isLoading {
                 ProgressView("Load News")
            } else {
                VStack {
                        CategoriesView(categories: newsVM.uniqueCategories, selectedCategory: $newsVM.selectedCategory)
                        
                        List(newsVM.filteredNews) { newsItem in
                            NavigationLink(destination:
                                NewsDetailView(news: newsItem)
                                    .environmentObject(newsBookmark)) {
                                NewsRowView(news: newsItem)
                                    .environmentObject(newsBookmark)
                                
                            }
                        }
                        .listStyle(.plain)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Image("Okezone_2020")
                                    .resizable()
                                    .frame(width: 170, height: 28)
                            }
                            
//                            ToolbarItem(placement: .navigationBarTrailing) {
//                                NavigationLink {
//                                    BookmarkView()
//                                        .environmentObject(newsBookmark)
//                                } label: {
//                                    BookmarkButton(numberOfBookmark: newsBookmark.new.count)
//                                }
//                            }
                            
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .refreshable {
                            await newsVM.fetchNews()
                    }
                       
                }
                
            }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
