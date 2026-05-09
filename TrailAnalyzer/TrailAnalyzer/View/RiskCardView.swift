//
//  RiskCard.swift
//  TrailAnalyzer
//
//  Created by 仲里絢音 on 2026/05/08.
//
import SwiftUI

struct RiskCardView: View {
    @State var risk: Risk
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(risk.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(risk.id)
                    .font(.title2)
            }
            Text(risk.description)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .background(.white, in: RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    let prediction = TrailAnalyzer().predictRisk()
    RiskCardView(risk: prediction)
}
