
import SwiftUI

struct ContentView: View {
    @State var imgName = "snowboard"
    
    var body: some View {
        VStack {
            Image(imgName)
                .resizable() // 画面のサイズにぴったり収まるようにする
                .aspectRatio(contentMode: .fit) // 崩れた縦横比をうまくフィットさせる
            Button("次へ") {
                imgName = "mycar"
            }
            .padding()
            .background(Color.gray)
            .foregroundColor(Color.white)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
