//: Playground - noun: a place where people can play
import Foundation
import UIKit
import PlaygroundSupport

let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

let paragraph = NSMutableParagraphStyle()
paragraph.alignment = .left

let attributes = [NSAttributedStringKey.paragraphStyle: paragraph, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17.0)]

let frame = CGRect(x: 25, y: 50, width: 330, height: 40)
let textView = TextViewWithPlaceholder(frame: frame)
textView.font = UIFont.systemFont(ofSize: 17)
textView.backgroundColor = UIColor.clear
textView.textAlignment = .left


containerView.addSubview(textView)

class TextViewWithPlaceholder: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        delegate = self
    }
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.0
        
        if self.text.characters.count == 0 {
            let newRect = CGRect(x: 4, y: 3, width: rect.width, height: rect.height)
            drawText(myText: "Placeholder...", textColor: UIColor.lightGray, inRect: newRect)
        }
    }
    
    func drawText(myText:String,textColor:UIColor, inRect:CGRect){
        let attributes = [NSAttributedStringKey.foregroundColor: textColor, NSAttributedStringKey.font:UIFont.systemFont(ofSize: 13.0)]
        myText.draw(in: inRect, withAttributes: attributes)
    }
}
    
extension TextViewWithPlaceholder: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        setNeedsDisplay()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}

