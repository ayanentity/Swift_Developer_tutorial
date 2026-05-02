//
//  Friends.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/01.
//

import Foundation //基本データを扱うため
import SwiftData


@Model
class Friend {
    var name: String
    var favoriteMovie: Movie? //nilかどうか、optionalにすることでお気に入りがなくても問題ないように

    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Elena"),
        Friend(name: "Graham"),
        Friend(name: "Mayuri"),
        Friend(name: "Rich"),
        Friend(name: "Rody"),
    ]
}

