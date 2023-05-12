import Foundation
import UIKit

extension String {
    func addTenge() -> String {
        return self + "₸"
    }
    
    func addCredit() -> String {
        return self + "C"
    }
    
    func addStrike() -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(
            string: self,
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])

        myMutableString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: myMutableString.length))
        
        return myMutableString
    }
}
