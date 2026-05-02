//
//  MovieList.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/01.
//

import SwiftUI
import SwiftData


struct MovieList: View {
    @Query private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?

    init(titleFilter: String = ""){ //検索ワードを受け取る
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
            }
        _movies = Query(filter: predicate, sort: \Movie.title)
    }
    

    var body: some View {
        Group{
            if !movies.isEmpty {
                List {
                    ForEach(movies) { movie in
                        NavigationLink(movie.title) {
                            MovieDetail(movie: movie)
                        }
                    }
                    .onDelete(perform: deleteMovies(indexes:))
                }
                .navigationTitle("Movies")
                .toolbar {
                    ToolbarItem {
                        Button("Add movie", systemImage: "plus", action: addMovie)
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        EditButton()
                    }
                }
                .sheet(item: $newMovie){ movie in //newMovieがあったら
                    NavigationStack{
                        MovieDetail(movie: movie, isNew: true)
                    }
                    .interactiveDismissDisabled()
                }
            } else {
                ContentUnavailableView("Add Movies", systemImage: "film.stack")
            }
        }
    }

    private func addMovie() { //リスト追加関数
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet){ //削除関数
        for index in indexes{
            context.delete(movies[index])
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}
