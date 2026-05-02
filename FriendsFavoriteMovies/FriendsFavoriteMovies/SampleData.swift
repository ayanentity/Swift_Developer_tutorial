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
    
    let modelContainer: ModelContainer //データベースコンテナの準備
    
    var context: ModelContext { //コンテキストの用意
        modelContainer.mainContext
    }
    
    var friend: Friend {
        Friend.sampleData.first!
    }
    
    var movie: Movie {
         Movie.sampleData.first!
     }
    
    private init() {
        let schema = Schema([ //データベースに「どんなテーブルがあるか」の設計図
            Friend.self,
            Movie.self,
                            ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true) //スキーマを渡して、メモリ上に保存、どんな棚が必要か．
        
        
        do {
            //　データベースの箱を作る
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            // サンプルデータクを追加予定リストに入れる
            insertSampleData()
            
            // 書き込む、.save()で確定
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)") // 失敗したら強制終了
        }
    }
    
    
    private func insertSampleData() { //関数
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        for movie in Movie.sampleData{
            context.insert(movie)
        }
    }
}
