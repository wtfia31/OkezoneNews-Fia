//
//  CategoriesView.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import SwiftUI

struct CategoriesView: View {
    var categories: [String]
    @Binding var selectedCategory: String?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("All News")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(selectedCategory == nil ?  Color("zone") : Color("oke"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onTapGesture {
                        selectedCategory = nil
                    }
                    .padding(.leading, 10)
                    
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(selectedCategory == category ? Color("zone") : Color("oke"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedCategory = category
                        }
                        .padding(.horizontal, 5)
                }
                
            }
            .padding(.top, 10)
        }
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: ["Nasional", "Megapolitan", "International"], selectedCategory: .constant(nil))
    }
}
