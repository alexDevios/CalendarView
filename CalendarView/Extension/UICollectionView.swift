import UIKit
import Foundation

extension UICollectionView {
    
    func dequeueCellWithClass<T>(_ cls: T.Type, for indexPath: IndexPath) -> T {
        let clsString = String(describing: cls.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: clsString, for: indexPath)
        
        return cell as! T
    }
    
    func dequeueHeaderWithClass<T>(_ cls: T.Type, for indexPath: IndexPath) -> T {
        let clsString = String(describing: T.self)
        let cell = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: clsString, for: indexPath)
        
        return cell as! T
    }
    
    func dequeueFooterWithClass<T>(_ cls: T.Type, for indexPath: IndexPath) -> T {
        let clsString = String(describing: T.self)
        let cell = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: clsString, for: indexPath)
        
        return cell as! T
    }
    
    func registerCellNib(_ cls: AnyClass?) {
        let clsString = String(describing: cls!.self)
        cls.map { self.register(UINib.nibWithClass($0), forCellWithReuseIdentifier: clsString) }
    }
    
    func registerCellClass(_ cls: AnyClass?) {
        cls.map {
            self.register($0, forCellWithReuseIdentifier: String(describing: $0.self))
        }
    }
    
    func registerCellClasses(_ classes: [AnyClass]?) {
        classes.map {
            for cls in $0 {
                self.registerCellClass(cls)
            }
        }
    }
    
    func registerCellNibs(_ classes: [AnyClass]?) {
        classes.map {
            for cls in $0 {
                self.registerCellNib(cls)
            }
        }
    }
    
    func registerHeaderClass(_ cls:AnyClass?) {
        cls.map {
            register($0,
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: String(describing: $0.self))
        }
    }
    
    func registerHeaderNib(_ cls:AnyClass?) {
        cls.map {
            register(UINib.nibWithClass($0),
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                     withReuseIdentifier: String(describing: $0.self))
        }
    }
    
    func registerFooterClass(_ cls:AnyClass?) {
        cls.map {
            register($0,
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                     withReuseIdentifier: String(describing: $0.self))
        }
    }
    
    func registerFooterNib(_ cls:AnyClass?) {
        cls.map {
            register(UINib.nibWithClass($0),
                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                     withReuseIdentifier: String(describing: $0.self))
        }
    }
}
