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
    
    @ObservedObject var okashiDatalist = OkashiData()
    
    
    var body: some View {
        
        
        GeometryReader(content: { geometry in
            
            ForEach(okashiDatalist.okashiList.reversed(), id: \.self.id) { okashi in
                ZStack {
                    
                    Color.white
                    
                    // 外部URLを使ってImageを表示する時
//                    AsyncImage(url: URL(string: "ここにURL")) { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit) // 横か縦がぴったりになるところで縦横比を保ちサイズを整える
//                                    .padding(.all, 40)
//
//                            } placeholder: {
//                                // 読み込み中のViewを表示
//                                Image("snowboard")
//                                    .resizable()
//                                    .scaledToFill() // 縦横比を保ちながらframeを埋め尽くす
//                                    // padingで開ける分画像のサイズを小さくする
//                                    .frame(width: geometry.size.width - 20, height: geometry.size.height - 20)
//                            }
                    
                    Image(uiImage: okashi.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit) // 横か縦がぴったりになるところで縦横比を保ちサイズを整える
                        .frame(width: 200, height: 200)
                        
                }
                .cornerRadius(10)
                .padding(.all, 30)
                .shadow(radius: 1.1)
                .offset(okashiDatalist.okashiList.first!.id == okashi.id ? transation : .zero)
                .rotationEffect((okashiDatalist.okashiList.first!.id == okashi.id ? .degrees(Double(transation.width / 15)) : .zero))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            transation = value.translation
                        })
                        .onEnded({ value in
            
                            if value.startLocation.x - 150 > value.location.x {
                                transation = .init(width: -800, height: 0)
                                // 0.3秒遅らせて配列から削除して、animationを最後まで行わせる
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                    okashiDatalist.removeFirstOkashiInList()
                                    if okashiDatalist.okashiList.count == 5 {
                                        okashiDatalist.addOkashiForList()
                                    }
                                    
                                    
                                    
//                                        numbers.removeFirst()
                                        transation = .zero
                                        
                                })
                                
                            }
                            else if value.startLocation.x + 150 < value.location.x {
                                transation = .init(width: 800, height: 0)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                                    okashiDatalist.removeFirstOkashiInList()
                                    if okashiDatalist.okashiList.count == 5 {
                                        okashiDatalist.addOkashiForList()
                                    }
                                        
                                    
//                                        numbers.removeFirst()
                                        transation = .zero
                                })
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
