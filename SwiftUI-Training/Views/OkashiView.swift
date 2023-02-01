//
//  OkashiView.swift
//  SwiftUI-Training
//
//  Created by Hasegawa Akito on 2023/01/30.
//

import SwiftUI

struct OkashiView: View {
    @ObservedObject var okashiDatalist = OkashiData()
    @State var inputText = ""
    
    var body: some View {
        VStack {
            TextField("テキストを入力", text: $inputText, onCommit: {
                okashiDatalist.serchOkashi(keyword: inputText)
                }
            )
            
            List(okashiDatalist.okashiList) { okashi in
                
                HStack {
                    Image(uiImage: okashi.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                    Text(okashi.name)
                }
                
            }
        }
    }
}

struct OkashiView_Previews: PreviewProvider {
    static var previews: some View {
        OkashiView()
    }
}
