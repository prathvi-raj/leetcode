import Foundation

let privateQueue = DispatchQueue.init(label: "com.slice.test")

privateQueue.async {
    print("A")
}

privateQueue.async {
    print("B")
}

privateQueue.async {
    print("C")
}

privateQueue.async {
    print("D")
    privateQueue.sync {
        print("E")
    }
    print("F")
}


var name = "Slice"
var appendToCapturedName = { [name] (string: String) -> String in
  return name.appending(string)
}

let one = appendToCapturedName("student")   // Slicestudent
name = "D"
let two = appendToCapturedName("student") // Dstudent


//enum StackError: Error {
//    case overflow
//    case emptyStack
//}
//
//class Stack<T> {
//    let limit: Int = 10
//    var array: [T]
//
//    var peek: T? {
//        return self.array.last
//    }
//
//    init() {
//        array = []
//    }
//
//    func push<T>(_ element: T) throws {
//        guard array.count - 1 < limit else {
//            throw StackError.overflow
//        }
//        self.array.append(element)
//    }
//
//    mutating func pop<T>() -> throws T? {
//        guard !self.array.isEmpty else {
//            throw StackError.emptyStack
//        }
//        return self.array.removeLast()
//    }
//}
