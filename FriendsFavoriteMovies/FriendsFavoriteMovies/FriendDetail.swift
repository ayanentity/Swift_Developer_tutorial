//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/02.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss //シートを閉じる
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false){
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            Picker("FavoriteMovie", selection: $friend.favoriteMovie){
                Text("None") // お気に入りがない人のため
                   .tag(nil as Movie?)
                
                ForEach(movies){ movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
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
                        context.delete(friend) //途中経過のfriendデータを消してね
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
            FriendDetail(friend: SampleData.shared.friend, isNew: true)
        }
}
