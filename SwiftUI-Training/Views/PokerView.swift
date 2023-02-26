import SwiftUI

struct PokerView: View {
    var body: some View {
        ZStack {
            
            Color.black
                 .ignoresSafeArea()
            
            VStack {
                Text("Stage : 1")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .foregroundColor(Color.yellow)
                    .font(Font.system(size: 35))
                
                VStack {
                    Text("Required Bet")
                        .foregroundColor(Color.yellow)
                        .font(Font.system(size: 35).bold())
                    Text("100")
                        .foregroundColor(Color.yellow)
                        .font(Font.system(size: 35).bold())
                }
                .padding()
                .padding(.horizontal, 20)
                .border(Color.yellow, width: 3)
                .cornerRadius(7)
                .frame(maxWidth: .infinity)
                
                Text("Bets of Member")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color.yellow)
                    .font(Font.system(size: 35).bold())
                
                VStack {
                    HStack {
                        Text("Haseaki")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                        
                        Spacer()
                        
                        Text("700")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("Marinford")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                        
                        Spacer()
                        
                        Text("700")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("graderin")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                        
                        Spacer()
                        
                        Text("700")
                            .foregroundColor(Color.yellow)
                            .font(Font.system(size: 30).bold())
                    }
                    .padding(.bottom, 10)
                    
                    
                    
                    
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .top) // 要素上寄せ
                
                HStack {
                    Button("Change Data") {
                        
                    }
                    .padding()
                    .frame(maxWidth: 140)
                    .border(Color.yellow, width: 2)
                    .cornerRadius(5)
                    .foregroundColor(Color.yellow)
                    .padding(.horizontal, 20)
                    
                    
                    
                    Button("Action") {
                        
                    }
                    .padding()
                    .frame(maxWidth: 140)
                    .background(Color.yellow)
                    .cornerRadius(5)
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 20)
                }
                
                
                
            }
        }
        
        
    }
}

struct PokerView_Previews: PreviewProvider {
    static var previews: some View {
        PokerView()
    }
}
