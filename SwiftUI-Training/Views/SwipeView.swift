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
            Image("snowboard")
                .resizable()
                .scaledToFill() // 縦横比を保ちながらframeを埋め尽くす
                .frame(width: geometry.size.width, height: geometry.size.height)
                
        })
        
        
    }
}



struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
