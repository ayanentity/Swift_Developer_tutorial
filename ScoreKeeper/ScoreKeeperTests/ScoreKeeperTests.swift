//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by 仲里絢音 on 2026/04/29.
//

import Testing
@testable import ScoreKeeper // このアプリフォルダをテストする

@MainActor // メインスレッドで実行
struct ScoreKeeperTests {

    @Test("Reset player scores", arguments: [0, 10, 20]) // > 色んな数字で試すことで「本当に汎用的に動くか」を確認

    func resetScores(to newValue: Int) async throws {
            var scoreboard = Scoreboard(players: [ //test用の2人
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5),
            ])
            scoreboard.resetScores(to: newValue)
            
            for player in scoreboard.players {
                #expect(player.score == newValue)
                   }
        }
    
    @Test("Highest score wins")
     func highestScoreWins() {
         let scoreboard = Scoreboard(
             players: [
                 Player(name: "Elisha", score: 0),
                 Player(name: "Andre", score: 4),
             ],
             state: .gameOver,
             doesHighestScoreWin: true
         )
         let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 4)])         
     }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
}
