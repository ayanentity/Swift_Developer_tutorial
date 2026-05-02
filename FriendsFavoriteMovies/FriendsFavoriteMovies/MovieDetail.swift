//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/02.
//
//

import SwiftUI
import SwiftData


struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }

    var sortedFriends: [Friend] {
        movie.favoritedBy.sorted { first, second in 
            first.name < second.name
        }
    }

    var body: some View {
        Form {
            TextField("Name", text: $movie.title)
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
            
            if !movie.favoritedBy.isEmpty{ //誰かがお気に入りに登録していたら
                Section("Favorite By"){ //セクションタイトル
                    ForEach(sortedFriends){ friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle( isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew {
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        context.delete(movie)
                            dismiss()
                    }
                }
            }
        }
    }
}

    
#Preview {
    NavigationStack{
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}
