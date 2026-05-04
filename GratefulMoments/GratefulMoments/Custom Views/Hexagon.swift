//
//  Hexagon.swift
//  GratefulMoments
//
//  Created by 仲里絢音 on 2026/05/05.
//
import SwiftUI

struct Hexagon <Content: View>: View {
    private let borderWidth = 4.0
    var borderColor: Color = .ember
    var layout: HexagonLayout = .standard
    var moment: Moment? = nil
    @ViewBuilder var content: () -> Content //他ビューでも受け入れるため、汎用型の宣言
    
    
    var body: some View {
        ZStack {
            if let background = moment?.image {
                Image(uiImage: background)
                    .resizable()
                    .scaledToFill()
            }
            
            content()
                .frame(width: layout.size, height: layout.size)
        }
        .mask {
                    Image(systemName: "capsule.portrait.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: layout.size - borderWidth, height: layout.size - borderWidth)
                        }
                    .background {
                        Image(systemName: "capsule.portrait.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: layout.size, height: layout.size)
                            .foregroundStyle(borderColor)
                    }
                    .frame(width: layout.size, height: layout.size)
            }
        }

#Preview {
    Hexagon(moment: Moment.imageSample) {
        Text(Moment.imageSample.title)
            .foregroundStyle(Color.white)
    }
    .sampleDataContainer()
}
