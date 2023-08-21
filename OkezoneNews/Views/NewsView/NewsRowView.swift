//
//  NewsRowView.swift
//  OkezoneNews
//
//  Created by DDL13 on 15/08/23.
//

import SwiftUI

struct NewsRowView: View {
    let news: News
//    @StateObject private var newsVM = NewsFetch()
    @EnvironmentObject var newsBookmark: Bookmark
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: news.image.medium)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 117, height: 110)
                    .clipShape(Rectangle())
                
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(news.title)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                Text(news.content)
                    .font(.system(size: 11, weight: .thin, design: .rounded))
                    .lineLimit(3)
                    .padding(.top, 10)
                
                HStack {
                    Text(news.categories.first!)
                        .font(.system(size: 10, weight: .thin, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(Color("oke"))
                    
                    Text(news.isoDate.formattedDate())
                        .font(.system(size: 10, weight: .thin, design: .rounded))
                        .fontWeight(.thin)
                        .lineLimit(1)
                        
                    
                    Spacer()
                    
                    Menu {
                        Menu {
                            Button {
                                
                            } label: {
                                Image("wa")
                                Text("Whatsapp")
                            }
                            
                            Button {
                                
                            } label: {
                                Image("ig")
                                Text("Instagram")
                            }
                            
                            Button {
                                
                            } label: {
                                Image("tw")
                                Text("Twitter")
                            }

                        } label: {
                            Image(systemName: "square.and.arrow.up")
                            Text("Share")
                        }
                        
                        Button(role: .cancel) {
                            newsBookmark.addBookmark(news)
                        } label: {
                            Image(systemName: "plus.circle")
                            Text("Add Bookmark")
                               
                        }
            
                    } label: {
                        Label("", systemImage: "ellipsis")
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
            NewsRowView(news:
                News(title: "Mengapa Proklamasi Diperingati Setiap Tahun?",
                link: "ini contoh link",
                content: "Mengapa Proklamasi Diperingati Setiap Tahun yakni pada tanggal 17 Agustus mendatang",
                categories: ["Nasional"],
                isoDate: "2023-08-13T02:44:58.000Z",
                image: ImageNews(
                    small: "",
                    medium: "https://img.okezone.com/dynamic/content/2023/08/15/337/2864704/mengapa-proklamasi-diperingati-setiap-tahun-8FRmRQb2zy.jpg?w=500",
                    large: "")
                )
            )
            .environmentObject(Bookmark())
    }
}
