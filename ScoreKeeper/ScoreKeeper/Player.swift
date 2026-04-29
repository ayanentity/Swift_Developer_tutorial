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

extension Player: Equatable { //既存の構造体から後から追加，Equatable があると == で比べられる
    static func == (lhs: Player, rhs: Player) -> Bool {
         lhs.name == rhs.name && lhs.score == rhs.score //両方のプロパティが一緒なら同じとみなす
     }
}
