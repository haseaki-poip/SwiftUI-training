//
//  SwipeView.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/31.
//

import SwiftUI

struct SwipeView: View {
    enum SelectedItem: Int {
        case tinder, good, comment, profile
        // 以下の書き方もできる
        // 何も値を型に入れない場合は0から順番に値が振られる
//        case tinder
//        case good
//        case comment
//        case profile
        
        // func -> 戻り値
        func changeColor() -> Color {
            switch( self ){
                    case .tinder:
                        return Color(UIColor.red)
                    case .good:
                        return Color(UIColor.yellow)
                    case .comment:
                        return Color(UIColor.blue)
                    case .profile:
                        return Color(UIColor.cyan)
            }
        }
    }
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    @State var selectedItem: SelectedItem = .tinder
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    selectedItem = .tinder
                    
                }, label: {
                    Image(systemName: "flame.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        // 三項演算子を使用して色を変化
                        .foregroundColor(selectedItem == .tinder ? Color.red : Color.gray)
                })
                    .frame(width: frameWidth / 5)
                Button(action: {
                    
                    selectedItem = .good
                    
                }, label: {
                    Image(systemName: "suit.diamond.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedItem == .good ? Color.yellow: Color.gray)
                })
                    .frame(width: frameWidth / 5)
                Button(action: {
                    
                    selectedItem = .comment
                    
                }, label: {
                    Image(systemName: "bubble.left.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedItem == .comment ? Color.green: Color.gray)
                })
                    .frame(width: frameWidth / 5)
                Button(action: {
                    
                    selectedItem = .profile
                    
                }, label: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedItem == .profile ? Color.blue: Color.gray)
                })
                    .frame(width: frameWidth / 5)
            }
            .padding()
            .frame(width: frameWidth)
         
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(width: frameWidth, height: 550)
                .background(Color.blue)
            
            HStack {
                
                BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "xmark", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
                
                BottomButtonView(frameWidth: frameWidth, imageSize: 15, backgroundSize: 50, imageName: "questionmark", imageColor: Color(UIColor.white), backgroundColor: Color(UIColor.gray))
                
                BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "heart", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
                       
            }
            .padding()
            .frame(width: frameWidth)
        }
    }
}


struct BottomButtonView: View {
    
    let frameWidth: CGFloat
    let imageSize: CGFloat
    let backgroundSize: CGFloat
    let imageName: String
    let imageColor: Color
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            backgroundColor
                .frame(width: backgroundSize, height: backgroundSize)
                .cornerRadius(50)
                .shadow(radius: 10)
            
            Button(action: {
                
                
            }, label: {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundColor(imageColor)
            })
                
        }
        .frame(width: frameWidth / 4)
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
