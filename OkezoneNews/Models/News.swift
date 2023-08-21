//
//  News.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import Foundation

struct News: Identifiable, Codable {
    var id = UUID()
    let title: String
    let link: String
    let content: String
    let categories: [String]
    let isoDate: String
    let image: ImageNews
}
struct ImageNews: Codable {
    let small: String
    let medium: String
    let large: String
    
}
