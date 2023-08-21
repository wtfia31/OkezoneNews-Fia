//
//  DateFormatter.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "MMM d, h:mm a"
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
}
