
import SwiftUI

struct ContentView: View {
    @State var imgName = "snowboard"
    @State var inputText = ""
    @ObservedObject var okashiDatalist = OkashiData()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("テキストを入力", text: $inputText, onCommit: {
                    okashiDatalist.serchOkashi(keyword: inputText)
                    }
                )
                ZStack {
                    Image(imgName)
                        .resizable() // 画面のサイズにぴったり収まるようにする
                        .aspectRatio(contentMode: .fit) // 崩れた縦横比をうまくフィットさせる
                    Color.gray
                        .frame(width: 200, height: 100)
                        .opacity(0.5)
                    Text(imgName)
                        .foregroundColor(Color.white)
                }
                
                HStack {
                    Button("前へ") {
                        imgName = "snowboard"
                    }
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .padding(.trailing, 10)
                    
                    Button("次へ") {
                        imgName = "mycar"
                    }
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(Color.white)
                    .padding(.leading, 10)
                    
                }
                NavigationView {
                    NavigationLink("1.1ページ目遷移", destination: Text("1.1ページ目")
                                    .navigationTitle("ページ1.1")
                                    
                    )
                }
                .frame(height: 200)
                // このNavigationViewの範囲内のところのみが遷移する。
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NavigationLink("お菓子ページ目遷移", destination: OkashiView()
                                    .navigationTitle("お菓子ページ")
                                    
                    )
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
