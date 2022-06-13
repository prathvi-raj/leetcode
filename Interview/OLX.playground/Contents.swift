import UIKit

/*
print("A")

DispatchQueue.main.async {
    print("B")

    DispatchQueue.main.async {
        print("C")

        DispatchQueue.main.async {
            print("D")

            DispatchQueue.main.sync {
                print("E")
            }
        }
    }


    DispatchQueue.global().sync {
        print("F")

        DispatchQueue.main.sync {
            print("G")
        }
    }

    print("H")
}

print("I")


///
/*
A
B
F
H
I
C
D
E
F
G

*/
*/
/*
print("Hello")

DispatchQueue.main.async {
    print("world")
}

DispatchQueue.main.sync {
    print("Im an iOS Developer")
}

DispatchQueue.main.async {
    print("END")
}

          /*
// sequence of output:
Hello
world
I'm an iOS Developer
END !!
*/
*/

/*
class Cred {
    var token: String

    init(token: String) {
        self.token = token
    }
}

class Demo {
    var authToken: String

    lazy var credObj: Cred = {
        return Cred(token: authToken)
    }()

    init(authToken: String) {
        self.authToken = authToken
    }
}

var demoObjc = Demo(authToken: "abcd")
print(demoObjc.credObj.token) // abcd

demoObjc.authToken = "xyz"
print(demoObjc.credObj.token) // abcd
*/

/*
var car: String = "zen"

var carName = {
    print("Captured Car Name is \(car)")
}

car = "audi"
print(carName())
*/

/*
var closureArr: [() -> ()] = []
var i = 0

for _ in 1...5 {
    closureArr.append {
        print(i)
    }
    i += 1
}

print(closureArr[0]()) //
print(closureArr[4]()) //
*/

/*
class Number {
    let n: Int

    init(n: Int) {
        self.n = n
    }

    deinit {
        print("Number class denitialized") // called or not ?
    }

    lazy var square: Int = { [self] in
        return self.n * self.n
    }()
}

var num: Number? = Number(n: 5)
num?.square
num = nil
*/


func address(_ o: UnsafeRawPointer) -> Int {
    return Int(bitPattern: o)
}

func addressHeap<T: AnyObject>(_ o: T) -> Int {
    return unsafeBitCast(o, to: Int.self)
}


struct myStruct {
    var a: Int
}

struct emptyStruct { }

var struct1 = myStruct(a: 5)
var struct2 = struct1
print(NSString(format: "%p", address(&struct1))) // diff
print(NSString(format: "%p", address(&struct2))) // diff

class myClass {

}

var class1 = myClass()
var class2 = class1
print(NSString(format: "%p", addressHeap(class1))) //same
print(NSString(format: "%p", addressHeap(class2))) //same

var arr: [Int] = [1,2,3,4,5]
var arr2 = arr

print(NSString(format: "%p", address(&arr))) //
print(NSString(format: "%p", address(&arr2))) //
