import Foundation
import UIKit

extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            // xib not loaded, or its top view is of the wrong type
            return nil
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.edges(to: self)
        return contentView   // 7
    }
    
    class func fromNib<T: UIView>() -> T {
        let type = T.self
        let nibName = String(describing: type)
        let nibs = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        return nibs![0] as! T
    }
}


@objc extension UIView {
    func edges(to view: UIView, left:CGFloat = 0, right:CGFloat = 0, top:CGFloat = 0, bottom:CGFloat = 0) {
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: left),
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: right),
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
            ])
    }
}
