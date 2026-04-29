//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by 仲里絢音 on 2026/04/27.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0 // リセットした時の値
  
    
    
    var body: some View {
        VStack (alignment: .leading){ // 左寄せ指定
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid { // デフォルトは上から下にセルを作っていく
                GridRow{ //コンテンツをすべて1行に
                    Text("Player")
                    Text("Score")
                }
                .gridColumnAlignment(.leading)
                .font(.headline)
                
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(Color.yellow)
                            }
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus"){
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)

            Spacer()
            
            HStack{
                Spacer() //両サイドにスペーサーを置いて中央配置
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.resetScores(to: startingPoints)
                        scoreboard.state = .setup
                    }
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
