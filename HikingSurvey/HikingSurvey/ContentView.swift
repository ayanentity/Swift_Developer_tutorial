//
//  ContentView.swift
//  HikingSurvey
//
//  Created by 仲里絢音 on 2026/05/05.
//

import SwiftUI


struct ContentView: View {
    @FocusState private var textFieldIsFocused: Bool //flag
    @State var responses: [Response] = []
    @State private var responseText = "" //追加テキスト
    var scorer = Scorer()
    
    func saveResponse(text: String) {
        let score = scorer.score(text)
        let response = Response(text: text, score: score)
        responses.insert(response, at: 0)
    }


    var body: some View {
        VStack {
            Text("Opinions on Hiking")
                .frame(maxWidth: .infinity)
                .font(.title)
                .padding(.top, 24)
            ScrollView { //この中に入っているものしか、スクロールに反映されない
                ChartView(responses: responses)
                ForEach(responses) { response in
                    ResponseView(response: response)  //(引数名: 渡す値)
                }
            }
            HStack {
                TextField("What do you think about hiking?", text: $responseText)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5) //段落は5行までいけるよ．垂直方向に伸びるよ
                Button("Done"){
                    guard !responseText.isEmpty else { return }
                    saveResponse(text: responseText)
                    responseText = "" //入力終わったらテキストフィールドを空に
                    textFieldIsFocused = false
                }
                .padding(.horizontal, 4)
            }
            .padding(.bottom, 8)
        }
        .onAppear { //同期処理、画面が表示された時に1回だけ実行
            for response in Response.sampleResponses {
                saveResponse(text: response)
            }
        }
        .padding(.horizontal)
        .background(Color(white: 0.94))
    }
}

#Preview {
    ContentView()
}
