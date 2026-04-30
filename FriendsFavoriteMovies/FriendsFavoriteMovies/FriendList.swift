//
//  FriendList.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/01.
//

import SwiftUI
import SwiftData


struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context


    var body: some View {
        List {
            ForEach(friends) { friend in
                Text(friend.name)
            }
        }
    }
}


#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}
