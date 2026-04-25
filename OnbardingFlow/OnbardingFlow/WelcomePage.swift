//
//  ContentView.swift
//  OnbardingFlow
//
//  Created by 仲里絢音 on 2026/04/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150,height: 150)
                    .foregroundStyle(.tint)
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size:70))
                    
            }
            Text("welcome to My App")
                .font(Font.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.top)
            
            Text("Discription")
                .font(Font.title2)
           
        }
    }
}

#Preview {
    WelcomePage()
}
