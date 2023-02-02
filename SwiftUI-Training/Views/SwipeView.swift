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
    
    // .zeroはCGSize.zeroのことで、前で型定義でCGSizeを指定しているため省略可
    @State var transation: CGSize = .zero // (x: 0, y: 0)
    @State var numbers = [0, 1, 2, 3, 4, 5]
    
    var body: some View {
        
        
        GeometryReader(content: { geometry in
            
            ForEach(numbers, id: \.self) { number in
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
                .offset(numbers.last == number ? transation : .zero)
                .rotationEffect(numbers.last == number ? .degrees(Double(transation.width / 15)) : .zero)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            transation = value.translation
                            print(value.translation.width)
                        })
                        .onEnded({ value in
                            if value.startLocation.x - 170 > value.location.x {
                                transation = .init(width: -800, height: 0)
                                numbers.removeLast()
                                transation = .zero
                            }
                            else if value.startLocation.x + 170 < value.location.x {
                                transation = .init(width: 800, height: 0)
                                numbers.removeLast()
                                transation = .zero
                            }
                            else {
                                transation = .zero
                            }
                        })
                )
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1))
                // .springはバネのような動きを持たせる
                // respponse: バネの硬さ, dampingFraction: クリティカルダンピングの量
                // blendDuration: バネの応答値
            }
            
        })
        
        
    }
}



struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
