//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/02.
//

import SwiftUI


struct MovieDetail: View {
    @Bindable var movie: Movie


    var body: some View {
        Form {
            TextField("Name", text: $movie.title)
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}

    
#Preview {
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie)
    }
}
