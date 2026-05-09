//
//  Untitled.swift
//  TrailAnalyzer
//
//  Created by 仲里絢音 on 2026/05/08.
//
//　enum状態管理と学習データTrailAnalyzerMedelを繋げる処理

import Foundation
import CoreML

struct TrailAnalyzer{
    func predictRisk() -> Risk {
        do {
            let model = try TrailAnalyzerModel(configuration: MLModelConfiguration()) //自動でTrailAnalyzerModel クラスが生成される
            
            let input = TrailAnalyzerModelInput( //サンプルを入れる
                            distance: 1,
                            elevation: 0,
                            terrain: "paved",
                            dangerous: 0
                    )
            let predictedRisk = try model.prediction(input: input).risk //入力値からリスクを予測
            
            switch predictedRisk { //値別に
                case 0..<20:
                    return .easy
                case 20..<50:
                    return .moderate
                case 50..<100:
                    return .difficult
                default:
                    return .highRisk
                }
            
        } catch {
            return .highRisk //もしリスクを予測できない場合（その他のエラー時）は、ハイリスクを返すように
        }
    }
}
