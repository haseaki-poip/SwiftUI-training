
import SwiftUI

struct HomeView: View {
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
                        .resizable() // imageのサイズを変更可能にする
                        .aspectRatio(contentMode: .fit) // 崩れた縦横比をうまくフィットさせる
                    // 画面のサイズにぴったり収まるようにする
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
                    NavigationLink(destination: {
                        OkashiView()
                                }, label: {
                                    Image(systemName: "flame.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        // 三項演算子を使用して色を変化
                                        .foregroundColor(Color.gray)
                                })
                    
                    NavigationLink("お菓子ページ", destination: OkashiView()
                                    .navigationTitle("お菓子ページ")
                                    
                    )
                    
                    NavigationLink("tinderページ", destination: SwipeView())
                }
                
            }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
