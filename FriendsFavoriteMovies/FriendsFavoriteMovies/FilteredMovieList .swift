//
//  FilteredMovieList .swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/02.
//

import SwiftUI
import SwiftData

struct FilteredMovieList: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
           Text("Select a movie")
               .navigationTitle("Movie")
               .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
