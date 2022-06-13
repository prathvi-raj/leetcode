import UIKit
import PlaygroundSupport


extension UILabel {
  func setHtmlText(html: String) {
    if let htmlData = html.data(using: .unicode) {
      do {
        self.attributedText = try NSAttributedString(data: htmlData,
                                                     options: [.documentType: NSAttributedString.DocumentType.html],
                                                     documentAttributes: nil)
      } catch let e as NSError {
        print("Couldn't parse \(html): \(e.localizedDescription)")
      }
    }
  }
}

let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
lbl.text = "Hello StackOverflow!"

lbl.setHtmlText(html: "Peace")
