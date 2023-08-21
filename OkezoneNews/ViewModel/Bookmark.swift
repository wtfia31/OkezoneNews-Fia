//
//  Bookmark.swift
//  OkezoneNews
//
//  Created by DDL13 on 17/08/23.
//

import Foundation

class Bookmark: ObservableObject {
    @Published var isBookmarked = false
    @Published var new: [News] = [] {
        didSet {
            saveBookmark()
        }
    }
    
    let newsKey: String = "news_key"
    
    
    init() {
        getBookmarks()
    }
    
    func getBookmarks() {
        guard
            let data = UserDefaults.standard.data(forKey: newsKey),
            let savedBookmarks = try? JSONDecoder().decode([News].self, from: data)
        else { return }

        self.new = savedBookmarks
    }
    
    func addBookmark (_ item: News) {
        new.append(item)
    }
    
    func removeBookmark(_ item: News) {
        new = new.filter { $0.id != item.id }
    }
    
    func contains(_ item: News) -> Bool {
        new.contains(where: {$0.id == item.id})
    }
    
    func toogleBookmark(item: News) {
        if contains(item) {
            removeBookmark(item)
        } else {
            addBookmark(item)
        }
    }
    
    func saveBookmark() {
        if let encoder = try? JSONEncoder().encode(new) {
            UserDefaults.standard.set(encoder, forKey: newsKey)
        }
    }
    
}
