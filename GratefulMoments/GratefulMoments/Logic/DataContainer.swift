//
//  Untitled.swift
//  GratefulMoments
//
//  Created by 仲里絢音 on 2026/05/04.
//
import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer

    var context: ModelContext {
        modelContainer.mainContext
    }


    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            Moment.self
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        do {
            // 1️⃣ 設計書通りに倉庫を建てる
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // 2️⃣ 作業台を確定する、サンプルデータをコンテナに格納
            if includeSampleMoments {
                loadSampleMoments()
            }
            try context.save()
            
      } catch {
          fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    
    private func loadSampleMoments() {
            for moment in Moment.sampleData {
                context.insert(moment)
            }
        }
}

private let sampleContainer = DataContainer(includeSampleMoments: true) //サンプルデータあり・メモリ上だけのプレビュー用コンテナを1つ作って保存

extension View {
    func sampleDataContainer() -> some View {
        self
            .modelContainer(sampleContainer.modelContainer) //全てのViewに sampleDataContainer()を追加.#Preview時関数の呼び出しだけで済むように
            .environment(sampleContainer)
    }
}
