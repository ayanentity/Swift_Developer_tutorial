//
//  DiceVeiw.swift
//  DiceVeiw
//
//  Created by 仲里絢音 on 2026/04/26.
//

import SwiftUI

struct DiceView: View {
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack{
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth:100, maxHeight:100) //幅の最大値が100pt
                .aspectRatio(1, contentMode: .fit) // コンテンツ内に収めるかつアスペクト比を保ちながら、サイズを調整
                .foregroundStyle(.black,.white)
            
            Button("Roll"){
                withAnimation{ // ディゾルブdissolve
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    DiceView()
}


