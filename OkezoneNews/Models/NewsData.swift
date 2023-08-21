//
//  NewsData.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import Foundation

struct NewsResponse: Codable {
    let data: [NewsData]
}

struct NewsData: Codable {
        let title: String
        let link: String
        let content: String
        let categories: [String]
        let isoDate: String
        let image: ImageNews
}
