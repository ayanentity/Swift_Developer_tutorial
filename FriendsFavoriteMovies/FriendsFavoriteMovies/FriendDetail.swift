//
//  FriendDetail.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/02.
//

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend


    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        .navigationTitle("Friend")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    NavigationStack {
            FriendDetail(friend: SampleData.shared.friend)
        }
}
