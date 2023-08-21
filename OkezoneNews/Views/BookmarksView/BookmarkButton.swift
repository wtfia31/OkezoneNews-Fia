//
//  BookmarkButton.swift
//  OkezoneNews
//
//  Created by DDL13 on 17/08/23.
//

import SwiftUI

struct BookmarkButton: View {
    
    var numberOfBookmark: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "bookmark")
                .padding(.top, 5)
            
            if numberOfBookmark > 0 {
                Text("\(numberOfBookmark)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(.red))
                    .cornerRadius(50)
                    
                
            }
        }
    }
}

struct BookmarkButton_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkButton(numberOfBookmark: 1)
    }
}
