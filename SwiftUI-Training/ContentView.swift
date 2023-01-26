//
//  ContentView.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var imgName = "snowboard"
    
    var body: some View {
        VStack {
            Image(imgName)
            Button("次へ") {
                imgName = "mycar"
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
