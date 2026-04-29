//
//  ContentView.swift
//  BirthdaysApp
//
//  Created by 仲里絢音 on 2026/04/29.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Elton Lin", birthday: .now),
        Friend(name: "Jenny Court", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    @State private var newName = ""
    @State private var newDate = Date.now

    
    var body: some View {
        NavigationStack{
            VStack {
                List(friends, id:\.name){ friend in
                    HStack{
                        Text(friend.name)
                        Spacer()
                        Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                    }
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom ){
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save"){
                        let newFriend = Friend(name: newName, birthday: newDate)
                        friends.append(newFriend) //リストに追加
                        
                        // 追加したら入力内容をリセット
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                  }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
}
