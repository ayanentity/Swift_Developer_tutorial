//
//  ImageGenerator.swift
//  ImageGenerator
//
//  Created by 仲里絢音 on 2026/05/11.
//

import SwiftUI
import ImagePlayground

@Observable //値が変わったら自動でUIに反映される
class ImageGenerator {
    var recipe = ImageGenerator.defaultRecipe
    var style: ImagePlaygroundStyle?
    
    var concepts: [ImagePlaygroundConcept] {
        [ImagePlaygroundConcept.text(recipe)]
    }
    
    func generate() async throws -> ImageCreator.CreatedImage{ //画像を生成するメソッド、時間がかかるからascyncの非同期throwで失敗したらエラーを投げる
        guard let style else { throw ImageCreator.Error.creationFailed } // style自体がImagePlaygroundStyle?でOptional型．だからguard let style で「値があるかどうか」を判定できる

               let imageCreator = try await ImageCreator()
               let images = imageCreator.images(for: concepts, style: style, limit: 1)
               for try await image in images {
                   return image
               }


               throw ImageCreator.Error.creationFailed
           }
       }


       extension ImageGenerator {
           static let recipes = ["Salad", "Sandwich", "Ice Cream"]
           static let styles: [ImagePlaygroundStyle] = [
               .animation,
               .illustration,
               .sketch
           ]


           static let imageSize: CGFloat = 256
           private static let defaultRecipe = recipes[0]
       }
