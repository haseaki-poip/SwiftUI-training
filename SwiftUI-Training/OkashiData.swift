//
//  OkashiData.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/30.
//

import Foundation
// ObservableObjectはclassで定義しなければならない。structではダメ
class OkashiData: ObservableObject {
    // Jsonデータ構造
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
            let comment: String?
        }
        
        let item: [Item]?
    }
    
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
        

        let task = URLSession.shared.dataTask(with: req_url, completionHandler: { data , response, error in
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
               // パターン1
               // 結果：通信結果のJSONをStringで得る。  -> { "id": 1, "name": "GOOD" }
               print(String(data: data, encoding: .utf8)!)
               
               // パターン2:JSON形式を構造体(Struct）に変換して使用する
               do {
                   // 結果:UserInfo構造体（Struct）を取得できる -> UserInfo
                   let json = try JSONDecoder().decode(ResultJson.self, from: data)
                   print(json)
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
