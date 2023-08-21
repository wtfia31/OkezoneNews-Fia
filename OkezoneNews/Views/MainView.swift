//
//  MainView.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import SwiftUI

struct MainView: View {

    @EnvironmentObject var newsBookmark: Bookmark
    
    var body: some View {
        TabView {
            NewsListView()
                .tabItem {
                    Label("News", systemImage: "house")
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            
            BookmarkView()
                .refreshable {
                    newsBookmark.getBookmarks()
                }
                .task {
                    newsBookmark.getBookmarks()
                }
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
                .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Bookmark())
    }
}
