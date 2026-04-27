//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by 仲里絢音 on 2026/04/27.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [ //独自のデータモデル
        Player(name: "Elisha", score: 0),
        Player(name: "Ayane", score: 0),
        Player(name: "Jasmine", score: 0),
        
    ]
    
    
    var body: some View {
        VStack (alignment: .leading){ // 左寄せ指定
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
                
            Grid {
                GridRow{
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                
                ForEach($players){ $player in
                    GridRow{ //コンテンツをすべて1行に
                        TextField("Name", text: $player.name) //nameはテキストフィールドが空の際に表示されるテキスト
                        Stepper("\(player.score)" , value: $player.score)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus"){
                players.append(Player(name: "", score: 0))
            }
            
            Spacer()
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
