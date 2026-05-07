//
//  ChartView.swift
//  HikingSurvey
//
//  Created by 仲里絢音 on 2026/05/06.
//
import SwiftUI
import Charts


struct ChartView: View {
    var responses: [Response]
    
    init(responses: [Response]) { // グラフの色をまとめるために、スコア順にソートする
           self.responses = responses.sorted { $0.score < $1.score }
       }
    
    var body: some View {
        Chart(responses) { response in
            SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.75)) //angle: .value("Type", 1)＝全員同じサイズ．内側を75%くり抜く
                .foregroundStyle(by: .value("sentiment", response.sentiment)) //sentiment型が持つラベル名をvalueとして
        }
        .chartForegroundStyleScale([
            Sentiment.positive : Sentiment.positive.sentimentColor,
            Sentiment.negative : Sentiment.negative.sentimentColor,
            Sentiment.moderate : Sentiment.moderate.sentimentColor
        ])
        .chartBackground { chartProxy in //チャートの背景に何か描くよ
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame { //グラフ描画のエリア
                    let frame = geometry[anchor] // 情報を取得後、フレームサイズとして代入
                    Image(systemName: "figure.hiking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: frame.height * 0.4)
                    .foregroundStyle(Color(white: 0.59))
                    .position(x: frame.midX, y: frame.midY)
                }
               }
        }
        .chartLegend(position: .trailing, alignment: .center) //ラベルをどこに配置するか
        .frame(height: 200)
        .padding()
    }
}


#Preview {
    ContentView()
}
