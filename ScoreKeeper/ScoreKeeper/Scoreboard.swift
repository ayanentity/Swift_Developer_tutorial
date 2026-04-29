//
//  Untitled.swift
//  ScoreKeeper
//
//  Created by 仲里絢音 on 2026/04/28.
//

import Foundation


struct Scoreboard { //新しい構造体
    var players: [Player] = [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 0),
            Player(name: "Jasmine", score: 0),
        ]

    var state = GameState.setup //スコアボードが作成された時点でこの状態に
    
    var doesHighestScoreWin = true
    
    var winners: [Player] { //計算プロパティ 呼ばれるたびに計算して値を返す
        c// 呼ばれたら以下の処理を行うif文に近いけど、前提条件が違う
        
        var winningScore = 0
              if doesHighestScoreWin {
                  winningScore = Int.min //Intで表せる最小の値
                  for player in players {
                      winningScore = max(player.score, winningScore) //比較して大きい方を返す
                }

              } else {
                  winningScore = Int.max
                  for player in players {
                      winningScore = min(player.score, winningScore)
                }

              }
        return players.filter { player in
            player.score == winningScore
        }
       }

    
    mutating func resetScores(to newValue: Int) { // 全員のスコアをnewValueにリセット
        for index in 0..<players.count {
                  players[index].score = newValue
              }
        }
}


/*@State private var players: [Player] = [ //独自のデータ）
Player(name: "Elisha", score: 0),
Player(name: "Ayane", score: 0),
Player(name: "Jasmine", score: 0),
]*/
