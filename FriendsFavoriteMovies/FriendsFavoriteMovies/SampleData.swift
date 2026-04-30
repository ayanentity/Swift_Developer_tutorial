//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by 仲里絢音 on 2026/05/01.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData() //シングルトン アプリ全体で1つだけ使い回す設計
    
    let modelContainer: ModelContainer
    
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    
    private init() {
        let schema = Schema([ //データベースに「どんなテーブルがあるか」の設計図
            Friend.self,
            Movie.self,
                            ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true) //スキーマを渡して、メモリ上に保存
        
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save()  
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        for movie in Movie.sampleData{
            context.insert(movie)
        }
    }
}
