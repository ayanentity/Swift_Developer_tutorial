//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/01.
//

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort:\ Movie.title) private var movies: [Movie] //Movie.swiftのclassデータを並べ替えて,moviesに入れる
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach (movies){ movie in
                    NavigationLink(movie.title){
                        Text("Detail view for \(movie.title)")
                            .navigationTitle("Movie")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                   
                }
            }
            .navigationTitle("Movies")
        } detail: {
            Text("Select a Friend")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer) //このViewが使うデータ倉庫はこれ
}
