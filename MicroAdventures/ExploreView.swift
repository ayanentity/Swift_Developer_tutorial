//
//  ExploreView.swift
//  MicroAdventures
//
//  Created by 仲里絢音 on 2026/04/23.
//
import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack{
            Text("Hello")
                .padding()
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 16))
            Text("I am ayanentity")
                .padding()
                .background(Color.red, in:RoundedRectangle(cornerRadius: 16))
        }
        HStack{
            DayForecast(day: "Mon", isRany:false, high: 20, low: 10)
            DayForecast(day: "Tue", isRany:true, high: 10, low: -2)
        }
        .padding()
    }
}


struct DayForecast: View {
    let day: String
    let isRany: Bool
    let high: Int
    let low: Int
    
    var iconName: String{
        if isRany{
            return "cloud.rain.fill"
        } else{
            return "sun.max.fill"
        }
    }
     
    var iconColor: Color{
        if isRany{
            return Color.blue
        } else {
            return Color.orange
        }
    }
    
    
    var body: some View {
        VStack {
            Text(day)
                .font(Font.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(4)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("low: \(low)")
                .fontWeight(Font.Weight.medium)
        }
        .padding()
    }
}

#Preview {
    ExploreView()
}
