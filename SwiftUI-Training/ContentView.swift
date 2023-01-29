
import SwiftUI

struct ContentView: View {
    @State var imgName = "snowboard"
    
    var body: some View {
        VStack {
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
                NavigationLink("ページ遷移", destination: Text("2ページ目")
                                .navigationTitle("ページ2")
                                
                )
            }
            .frame(height: 200)
            // このNavigationViewの範囲内のところのみが遷移する。
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
