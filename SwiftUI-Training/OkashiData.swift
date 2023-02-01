//
//  OkashiData.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/30.
//

import Foundation
import UIKit

// Identifiableは一意に識別できる型
// id = UUID()でデータを一意に特定するためのIDを生成する
struct OkashiItem: Identifiable {
    let id = UUID() // idは型定義ではなくUUIDを代入していることに注意
    let name: String
    let link: URL
    let image: UIImage
}
// ObservableObjectはclassで定義しなければならない。structではダメ
class OkashiData: ObservableObject {
    // Jsonデータ構造
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
//            let comment: String?
        }
        
        let item: [Item]?
    }
    
    @Published var okashiList: [OkashiItem] = []
    
    func serchOkashi(keyword: String){
        
        print(keyword)
        
        // キーワードをエンコード
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLを組み立て
        guard let req_url = URL(string: "https://www.sysbird.jp/webapi/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        // 画面更新やPublishedを更新する際メインスレッドで行う必要がある
        // OperationQueue.mainによって可能
        // OperationQueue.mainを設定しないと外部でPublishedを変更できないと警告が出る

        let task = session.dataTask(with: req_url, completionHandler: { data , response, error in
           session.finishTasksAndInvalidate()
            
           if let error = error {
               print(error.localizedDescription)
               print("通信が失敗しました")
               return
           }
           
           guard let data = data,
                 let response = response as? HTTPURLResponse else {
               print("データもしくはレスポンスがnilの状態です")
               return
           }
           
           if response.statusCode == 200 {
               // 結果：通信結果のJSONをStringで得る。
               print(String(data: data, encoding: .utf8)!)
               
               // パターン2:JSON形式を構造体(Struct）に変換して使用する
               do {
                   
                   let json = try JSONDecoder().decode(ResultJson.self, from: data)
                   print(json)
                   
                   if let items = json.item { // itemsに代入しつつ、それがnilかどうか。nilでなければその{}の処理を行え、その中でitemsを使える
                       self.okashiList.removeAll()
                       
                       for item in items {
                           if let name = item.name,      // 値があれば次の行を実行
                              let link = item.url,       // 値があれば次の行を実行
                              let imageURL = item.image, // 値があれば次の行を実行
                              let imageData = try? Data(contentsOf: imageURL), // 値があれば次の行を実行
                              let image = UIImage(data: imageData)?.withRenderingMode(.alwaysOriginal) {
                               
                               // ifにより上の要素が一つもnilでないため以下の処理を行うことができる
                               let okashi = OkashiItem(name: name, link: link, image: image)
                               self.okashiList.append(okashi)
                               
                           }
                       }
                   }
                   else {
                       self.okashiList.removeAll()
                   }
                   
                   print(self.okashiList)
                   
                   
               } catch let error {
                   print(":エラー:\(error)") // JSONの値がIDがIntなのに、StructでIDをStringと宣言している時などエラーになる。
               }
               
               
           } else {
               print("statusCode:\(response.statusCode)")
           }
        })
        
        task.resume()
    }
}
