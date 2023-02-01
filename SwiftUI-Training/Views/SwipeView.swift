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
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .frame(width: frameWidth, height: 550)
                .background(Color.blue)
            
            BottomControllView()
            
        }
    }
}


struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
