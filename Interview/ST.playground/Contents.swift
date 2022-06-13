import Foundation

protocol VC {
    typealias Name = String

    func getName(name: Name) -> Name
}

struct User: Equatable {
    let name: String
    let id: String

    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}


func addition<T: Numeric>( a: T, b: T) -> T {
    return a + b
}


func simpleaDefer() {
defer { print("1") }
defer { print("2") }
defer { print("3") }
print("4")
}

simpleaDefer()


extension Array {
    func dReduce<T>(initialValue: T,
                    next: (T, Element) -> T) -> T {
        var result: T = initialValue
        for a in self {
            result = next(result, a)
        }
        return result
    }
}

print([1,2,3].dReduce(initialValue: "") { res, cur in
    return res + "\(cur)"
})


class Manager {

    private let lock: NSLock = NSLock()
    var a: Int {
        get {
            return self.aValue
        } set {
            lock.lock()
            self.aValue = newValue
            lock.unlock()
        }
    }

    private var aValue: Int = 0

    static let shared: Manager = Manager()
    private init() {}
}


print("1")
DispatchQueue.main.async {
    print("3")

    DispatchQueue.main.async {
        print("2")
    }

    print("4")

}
print("5")


/*
 13452
 */
