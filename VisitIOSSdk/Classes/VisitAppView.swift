import Foundation
import UIKit
import WebKit

struct VisitMessage: Decodable {
    let method: String
    let roomName: String?
    let token: String?
    let doctorName: String?
    let profileImg: String?
    let url: String?
    let email: String?
    let subject: String?
}

public class VisitAppView : WKWebView, WKScriptMessageHandler {
    
    public var videoCallDelegate: VisitVideoCallDelegate?
    
    public init() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true
        super.init(frame: .zero, configuration: webConfiguration)
        webConfiguration.userContentController.add(self, name: "visitIosView")
        self.scrollView.isScrollEnabled = false
        self.isMultipleTouchEnabled = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if let body = message.body as? String {
            print("Body is \(body)")
            let bodyAsData = body.data(using: .utf8)!
            guard let eventData : VisitMessage = try? JSONDecoder().decode(VisitMessage.self, from: bodyAsData) else { return }
            switch eventData.method {
            case "startVideoCall":
                let roomName = eventData.roomName!
                let token = eventData.token!
                let doctorName = eventData.doctorName!
                let profileImg = eventData.profileImg!
                self.videoCallDelegate?.segueToVideoCall(accessToken: token, roomName: roomName, doctorName: doctorName, doctorProfileImg: profileImg)
            case "openPDF":
                let url = eventData.url!
                if let url = URL(string: url) {
                    UIApplication.shared.open(url)
                }
            case "mailTo":
                let email = eventData.email!
                let subject = eventData.subject!
                var mail = "mailto:\(email)?subject=\(subject)"
                mail = mail.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
                let link = URL(string: mail)
                if let link = link {
                    if UIApplication.shared.canOpenURL(link) {
                        UIApplication.shared.open(link, options: [:])
                    }
                }
            case "closeView":
                self.videoCallDelegate?.navigationController?.popViewController(animated: true)
                self.configuration.userContentController.removeAllUserScripts()
                self.removeFromSuperview()
                self.navigationDelegate = nil
                self.scrollView.delegate = nil
                self.stopLoading()
            default:
                break
            }
        }
    }

    @discardableResult
    public func load(appUrl: String) -> WKNavigation? {
        if let url = URL(string: appUrl) {
            let req = URLRequest(url: url)
            return super.load(req)
        }
        return nil
    }
}
