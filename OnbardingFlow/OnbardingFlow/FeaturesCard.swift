//
//  FeaturesCard.swift
//  OnbardingFlow
//
//  Created by 仲里絢音 on 2026/04/25.
//

import SwiftUI


struct FeatureCard: View {
    let iconName: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50) //アイコンのフレームを指定
                .padding(.trailing, 10) //右方向に10pt pr-10と同じ
            
            
            Text(description)
            Spacer() // HStack内だと水平方向のみでfigmaのwidth：fill
        }
        .padding()
        .background {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.tint)
                        .opacity(0.24)
                        .brightness(-0.4) // コントラスト
                }
        .foregroundStyle(.white)
    }
    
}


#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill",
                description: "A multiline description about a feature paired with the image on the left.")
}
