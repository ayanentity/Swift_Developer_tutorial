//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by 仲里絢音 on 2026/04/27.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = [] //空のリストスタート
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false //デフォルト状態がfalse
        
    var body: some View {
        VStack{
            VStack(spacing: 8) {
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical) // SF Symbolsのアイコンの色の付け方を指定するModifier レイヤーが下にいくほど薄くなる
                Text("Pick-a-Pal")
            }
            .font(.title)
            .bold()
            
            Text(pickedName.isEmpty ? " " : pickedName) //if構文の簡略化
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
   
            List{
                ForEach(names, id: \.description){ name in
                    Text(name)
                }
            }
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled() //
                .onSubmit { // Enterキーを押した時の実行
                    if !nameToAdd.isEmpty{
                        names.append(nameToAdd) //リストに追加
                        nameToAdd = "" // テキストフィールドの初期化
                    }
                }
            
            Divider()
            
            Toggle("Remove when picked", isOn: $shouldRemovePickedName) //状態記録を同期
            
            Button{
                if let randomName = names.randomElement(){
                pickedName =  randomName
                    
                if shouldRemovePickedName {
                        names.removeAll { name in //配列から条件に一致する要素を全部削除
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = "" // リストが空の場合
                }
                
            } label: {
                Text("Pick Random Name")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
