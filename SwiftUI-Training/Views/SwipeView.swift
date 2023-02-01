//
//  SwipeView.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/31.
//

import SwiftUI

struct SwipeView: View {
    private let frameWidth: CGFloat = CGFloat(UIScreen.main.bounds.width)
    
    var body: some View {
        VStack {
            
            TopControllView()
            
            CardView()
            
            BottomControllView()
            
        }
        .navigationBarHidden(true) // 画面遷移後のbackボタンやtitle部分のNavigationBarを削除
    }
}

struct CardView: View {
    var body: some View {
        
        
        GeometryReader(content: { geometry in
            ZStack {
                
                Color.white
                AsyncImage(url: URL(string: "https://sysbird.jp/toriko/wp-content/blogs.dir/2/files/2019/12/10099.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit) // 横か縦がぴったりになるところで縦横比を保ちサイズを整える
                                .padding(.all, 40)
                                
                        } placeholder: {
                            // 読み込み中のViewを表示
                            Image("snowboard")
                                .resizable()
                                .scaledToFill() // 縦横比を保ちながらframeを埋め尽くす
                                // padingで開ける分画像のサイズを小さくする
                                .frame(width: geometry.size.width - 20, height: geometry.size.height - 20)
                        }
//
                    
            }
            .cornerRadius(10)
            .padding(.all, 10)
            .shadow(radius: 10)
                
        })
        
        
    }
}



struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
