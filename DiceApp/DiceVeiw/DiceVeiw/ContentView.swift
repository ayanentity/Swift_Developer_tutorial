//
//  ContentView.swift
//  DiceVeiw
//
//  Created by 仲里絢音 on 2026/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1 //変数が変わったら画面も更新

    var body: some View {
        VStack{
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            HStack{
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
            }
            HStack{
                Button("Remove Dive",systemImage: "minus.circle.fill"){
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1) // 1の場合は選択不可
                
                Button("Add Dice", systemImage: "plus.circle.fill"){
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            //.labelStyle(.iconOnly)　iconだけはあまり望ましくないので
            .font(.title3)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("sampleBackground"))
        .tint(.white)
    }
}

#Preview {
    ContentView()
}


