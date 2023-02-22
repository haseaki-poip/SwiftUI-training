import Foundation
import UIKit

class WebSocketController: UIViewController, URLSessionWebSocketDelegate {
    
    private var webSocketTask: URLSessionWebSocketTask?
    func connect() {
        let urlSession = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: OperationQueue()
        )
        let url = URL(string: "ws://localhost:8000/")
        webSocketTask = urlSession.webSocketTask(with: url!)
        
        webSocketTask?.resume()
    }
    
    func ping() {
        webSocketTask?.sendPing { error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func close() {
        webSocketTask?.cancel(with: .goingAway, reason: "demo ended".data(using: .utf8))
    }
    
    
    func receive() {
        webSocketTask?.receive(completionHandler: { [weak self] result in
            print("r")
            switch result {
              case .success(let message):
                switch message {
                  case .string(let text):
                    print("Received! text: \(text)")
                  case .data(let data):
                    print("Received! binary: \(data)")
                  @unknown default:
                    fatalError()
                }
                self?.receive()  // <- 継続して受信するために再帰的に呼び出す
              case .failure(let error):
                print("Failed! error: \(error)")
            }
          }
        )
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("did connect")
        // 作成した関数をここで呼び出しておかないと使えない
        ping()
        receive()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reson: Data?) {
        print("did close connection")
    }
    
}

