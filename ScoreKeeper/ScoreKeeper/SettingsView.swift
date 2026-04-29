//
//  SettingsView.swift
//  ScoreKeeper
//
//  Created by 仲里絢音 on 2026/04/29.
//

import SwiftUI

struct SettingsView: View{
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int //プロパティの接続
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Win condition", selection: $doesHighestScoreWin) {
               Text("Highest Score Wins")
                   .tag(true) //選択したらこの値を返す
               Text("Lowest Score Wins")
                   .tag(false)
                       }
            Picker("Starting Points", selection: $startingPoints){
                Text("0 starting points")
                    .tag(0) //tagの値で更新
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 30.0))
    }
}
    




#Preview {
    @Previewable @State var doesHighestScoreWin = true
    @Previewable @State var startingPoints = 10
    SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
