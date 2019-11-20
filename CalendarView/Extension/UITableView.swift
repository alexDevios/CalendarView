import UIKit
import Foundation

extension UITableView {
    func cellWithClass(_ cls: AnyClass) -> UITableViewCell {
        var cell: UITableViewCell?
        cell = self.dequeueReusableCell(withIdentifier: String(describing: cls.self))
        if (cell == nil) {
            cell = UINib.objectWithClass(cls) as? UITableViewCell
        }
        
        return cell!
    }
    
    func dequeueCellWithClass<T>(_ cls: T.Type,  path: IndexPath) -> T {
        let clsString = String(describing: cls.self)
        return self.dequeueReusableCell(withIdentifier: clsString, for: path) as! T
    }
    
    func registerCell(withClass cls: AnyClass?) {
        if let cls = cls {
            self.register(UINib.nibWithClass(cls), forCellReuseIdentifier: String(describing: cls.self))
        }
    }
    
    func registerCells(withClasses classes: [AnyClass]?) {
        _ = classes?.compactMap { self.registerCell(withClass: $0) }
    }
    
    func registerHeaderFooterView(withClass cls: AnyClass?) {
        if let cls = cls {
            self.register(UINib.nibWithClass(cls), forHeaderFooterViewReuseIdentifier: String(describing: cls.self))
        }
    }
    
    func registerHeaderFooterViews(withClass classes: [AnyClass]?) {
        _ = classes?.compactMap { self.registerHeaderFooterView(withClass: $0) }
    }
    
    func dequeueHeaderFooterWithClass<T>(_ cls: T.Type) -> T {
        let clsString = String(describing: cls.self)
        return self.dequeueReusableHeaderFooterView(withIdentifier: clsString) as! T
    }
    
    func update(_ block: () -> ()) {
        self.beginUpdates()
        block()
        self.endUpdates()
    }
    
}
