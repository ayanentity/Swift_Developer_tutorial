//
//  Scorer.swift
//  HikingSurvey
//
//  Created by 仲里絢音 on 2026/05/06.
//

import Foundation
import NaturalLanguage //自然言語フレームワーク

struct Scorer {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    func score(_ text: String) -> Double { //スコアを返す関数
        var sentimentScore = 0.0
        tagger.string = text
        tagger.enumerateTags(
            in: text.startIndex..<text.endIndex, // 全文を対象に
            unit: .paragraph, // 段落単位で
            scheme: .sentimentScore, // 感情スコアで
            options: []) { sentimentTag, _ in //結果を受け取る
                if let sentimentString = sentimentTag?.rawValue,
                   let score = Double(sentimentString) {
                    sentimentScore = score
                    return true
                }


                return false
            }
        return sentimentScore
    }
}
