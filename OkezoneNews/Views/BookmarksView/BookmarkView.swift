//
//  BookmarkView.swift
//  OkezoneNews
//
//  Created by DDL13 on 17/08/23.
//

import SwiftUI

struct BookmarkView: View {
    
    @EnvironmentObject var newsBookmark: Bookmark

    var body: some View {
        NavigationStack {
            if newsBookmark.new.count == 0 {
                Text("Anda belum menambahkan Bookmark")
                    .font(.subheadline)
                    .fontWeight(.thin)
                
            } else {
                List(newsBookmark.new, id: \.id) { item in
                    NavigationLink {
                        BookmarkDetailView(news: item)
                    } label: {
                        BookmarkRowView(news: item)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Bookmarks")
                .navigationBarTitleDisplayMode(.inline)
                .refreshable {
                    newsBookmark.getBookmarks()
                }
            }
        }
        .task {
            newsBookmark.getBookmarks()
        }
    }
}
    

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
            .environmentObject(Bookmark())
    }
}
