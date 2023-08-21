//
//  BookmarkDetailView.swift
//  OkezoneNews
//
//  Created by DDL13 on 17/08/23.
//

import SwiftUI

struct BookmarkDetailView: View {
    
    @EnvironmentObject var newsBookmark: Bookmark
    let news: News
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                     AsyncImage(url: URL(string: news.image.large)) { phase in
                        phase
                        .resizable()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.top)
                        .scaledToFill()
                            .overlay{
                                Color.secondary
                                    .opacity(0.5)
                            }
                            
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200)
                    }
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Published: \(news.isoDate.formattedDate())")
                                    .font(.system(size: 12, weight: .thin, design: .rounded))
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                .padding(.vertical, 5)
                                
                                Spacer()
                                    
                            }
                            
                            Text(news.title)
                                .font(.system(size: 22, weight: .semibold, design: .rounded))
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            
                            Text(news.content)
                                .font(.system(size: 15, weight: .light, design: .rounded))
                                .padding(.vertical, 5)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                            
                            Link(destination: URL(string: news.link)!) {
                                Text("Lihat selengkapnya")
                                    .font(.system(size: 15, weight: .bold, design: .default))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color("zone"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .padding(.vertical)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 10)
                                
                            }

                        }
                    }
               
                }
            .padding(.top, 97)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct BookmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkDetailView(news:
            News(title: "Mengapa Proklamasi Diperingati Setiap Tahun?",
                 link: "https://news.okezone.com/read/2023/08/15/1/2864789/pemerintah-indonesia-gelar-kick-off-meeting-world-water-forum-ke-10",
                content: "Mengapa Proklamasi Diperingati Setiap Tahun yakni pada tanggal 17 Agustus mendatang",
                categories: ["nano", "halo"],
                isoDate: "2023-08-13T02:44:58.000Z",
                image: ImageNews(
                    small: "",
                    medium: "",
                    large: "https://img.okezone.com/dynamic/content/2023/08/15/1/2864789/pemerintah-indonesia-gelar-kick-off-meeting-world-water-forum-ke-10-Vc1klohb49.jpg?w=800")
            )
        )
    }
}
