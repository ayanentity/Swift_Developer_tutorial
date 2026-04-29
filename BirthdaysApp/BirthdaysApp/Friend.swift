//
//  Friend.swift
//  BirthdaysApp
//
//  Created by 仲里絢音 on 2026/04/29.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    var isBirthdayToday: Bool { //今日誕生日かのBool条件
            Calendar.current.isDateInToday(birthday)
        }
}
