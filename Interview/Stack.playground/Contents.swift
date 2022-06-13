import Foundation

class Stack<T> {
    var array: [T]
    init() {
        self.array = []
    }

    func peek() -> T? {
        return array.last
    }
}
