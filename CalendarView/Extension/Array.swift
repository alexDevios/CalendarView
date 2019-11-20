import Foundation

extension Array {
    
    mutating func move(from index: Int, to destIndex: Int) {
        let object = self[index]
        self.remove(at: index)
        self.insert(object, at: destIndex)
    }
    
    func objectWithClass(_ cls: AnyClass) -> AnyObject? {
        for object in self {
            let objectClass = type(of: object)
            
            if objectClass == cls {
                return object as AnyObject?
            }
        }
        
        return nil
    }
    
    func contains<T>(obj: T) -> Bool where T : Equatable {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    public func toDictionary<Key: Hashable> (with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
