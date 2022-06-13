import Foundation

/*
 Generic programming is a way to write functions and data types while making minimal assumptions about the type of data being used. Swift generics create code that does not get specific about underlying data types, allowing for elegant abstractions that produce cleaner code with fewer bugs. It allows you to write a function once and use it on different types.
 */

/*
func addInts(x: Int, y: Int) -> Int {
  return x + y
}


let intSum = addInts(x: 1, y: 2)

func addDoubles(x: Double, y: Double) -> Double {
  return x + y
}

let doubleSum = addDoubles(x: 1.0, y: 2.0)


struct Queue<Element> {
  let root: Element

  init(root: Element) {
    self.root = root
  }
}

extension Queue {
  func peek() -> Element? {
    return root
  }
}

let a = Queue<Int>(root: 5)
let b = Queue<String>(root: "A")
//print(a.root)
//print(b.root)


func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
  return Array(dictionary)
}

//print(pairs(from: [1:2, 3:4]))


func mid<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1) / 2]
}


mid(array: [1,2,3,4,5])


protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }
extension Int: Summable {}
extension Double: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

print(add(x: 4, y: 5))
print(add(x: 4.5, y: 5.5))

extension String: Summable {}
let addString = add(x: "Generics", y: " are Awesome!!! :]")
print(addString)

*/
/*
extension Array {
  public func dmap<T>(_ transform: (Element) -> T) -> [T] {
    var s: [T] = []
    for a in self {
      s.append(transform(a))
    }
    return s
  }

  public func dreduce<T>(initialResult: T, nextPar: ((T, Element) -> T)) -> T {
    var s: T = initialResult
    for a in self {
      s = nextPar(s, a)
    }
    return s
  }


}



print([1,2,3].contains(6))
print([1,2,3].dmap { return $0*$0 })
print(
  [1,2,3].reduce(5) { $0 + $1 })
*/

/*
extension Sequence {
    func dforEach(_ operation: (Element) -> Void) {
        for e in self {
            operation(e)
        }
    }
}


[1,2,3].dforEach { print(2*$0) }

*/

/*

let numbers: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
numbers.flatMap { <#[Int]#> in
    return
}
let result: [[Int]] = numbers.compactMap({
    print($0)
    return $0
})
print(result)
*/


/*
struct WannabeFunction {
    func callAsFunction() {
        print("Hi theres")
    }
    func callAsFunctionas() {
        print("Hi there")
    }
}

let f = WannabeFunction()
f()
*/


func print(address o: UnsafeRawPointer ) {
    print(String(format: "%p", Int(bitPattern: o)))
}


var array1: [Int] = [0, 1, 2, 3]
var array2 = array1

//Print with just assign
// print(address: array1) //0x600000078de0
// print(address: array2) //0x600000078de0
array2.append(4)

print(address: array2) //0x600000078de0


final class Ref<T> {
    var value: T
    init(_ val: T) {
        self.value = val
    }
}


struct Box<T> {
    private var ref: Ref<T>
    var value: T {
        get{
            ref.value
        }set{
            guard !isKnownUniquelyReferenced(&ref) else {
                ref.value = newValue
                return
            }
            self.ref = Ref(newValue)
        }
    }
    init(_ val: T) {
        self.ref = Ref(val)
    }
}

struct Person {
    let name: String
    init(name: String){
        self.name = name
    }
}

let a: Box<Person> = Box(Person(name: "Shyam"))
let b =  a

print(Unmanaged.passUnretained(a).toOpaque())
print(Unmanaged.passUnretained(b).toOpaque())
