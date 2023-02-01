//
//  BottomControllView.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/02/01.
//

import SwiftUI

struct BottomControllView: View {
    
    private let frameWidth: CGFloat = CGFloat(
        UIScreen.main.bounds.width
    )
    
    var body: some View {
        HStack {
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "xmark", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 15, backgroundSize: 50, imageName: "questionmark", imageColor: Color(UIColor.white), backgroundColor: Color(UIColor.gray))
            
            BottomButtonView(frameWidth: frameWidth, imageSize: 30, backgroundSize: 65, imageName: "heart", imageColor: Color(UIColor.systemPink), backgroundColor: Color(UIColor.white))
                   
        }
        .padding()
        .frame(width: frameWidth)
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
                .asRoundShadow(size: backgroundSize) // 一括で作成したmodifire
            
            Button(action: {
              
                
            }, label: {
                Image(systemName: imageName)
                    .asButtonImage(size: imageSize, color: imageColor)
            })
                
        }
        .frame(width: frameWidth / 4)
    }
}

// Modifireを別で一度に作成 modifireの共通化などに便利。
struct BottomButtonModifire: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(50)
            .shadow(radius: 10)
    }
}


extension View {
    func asRoundShadow(size: CGFloat) -> some View {
        modifier(BottomButtonModifire(size: size))
    }
    
}

// Imageのような固有の要素に対してはmodifireを作成できないため
// 以下のようにextensionを書き、そこでmodifireを設定する
extension Image {
    func asButtonImage(size: CGFloat, color: Color) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
