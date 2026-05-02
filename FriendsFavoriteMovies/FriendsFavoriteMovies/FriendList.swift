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
    @State private var newFriend: Friend? //Friendが入ってるか、空（nil）か


    var body: some View {
        NavigationSplitView {
            Group{ //if文には .navigationTitle をつけられない.Group = 複数のViewをまとめる透明な箱
                if !friends.isEmpty {
                    List {
                        ForEach(friends) { friend in
                            NavigationLink(friend.name) {
                                FriendDetail(friend: friend)
                            }
                        }
                    .onDelete(perform: deleteFriend(indexes:))
                }
            } else {
                ContentUnavailableView("Add Friends", systemImage: "person.and.person.fill")
            }
        }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem {
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing){ //距離を離してね
                   EditButton()
                }
            }
            .sheet(item: $newFriend){ friend in //入ってきたらシートを出す
                NavigationStack{
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled() //スライドしてシートを閉じるのを防ぐ
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }


    private func addFriend() {
        let newFriend = Friend(name: "")
        context.insert(newFriend)
        self.newFriend = newFriend //ここでシートの状態がnilじゃないことを返す
    }
    
    private func deleteFriend(indexes: IndexSet){
        for index in indexes{
            context.delete(friends[index])
        }
    }

}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

#Preview("Empty List") {
    FriendList()
        .modelContainer(for: Friend.self, inMemory: true)
}
