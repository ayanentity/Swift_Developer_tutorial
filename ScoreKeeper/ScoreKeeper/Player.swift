    //
//  Player.swift
//  ScoreKeeper
//
//  Created by 仲里絢音 on 2026/04/28.
//

import Foundation


struct Player: Identifiable{
    let id = UUID() //UUID()普遍的に一意な識別子,Identifiableのプロトコルに準拠するために絶対必要なidプロパティ,Universally Unique Identifier
    
    var name: String
    var score: Int

}
