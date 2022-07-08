import Foundation

/*
 What is output of following code?
 */

class Q1 {

    func run() {

        var a = 6
        var b = 9

        var newClouser: ()->() = { [a, b] in
            print(a+b)
        }

        a=3
        b=3
        newClouser()
    }
}
//Q1().run()

class Q2 {
    var a = 6
    var b = 9

    lazy var newClouser: ()->() = { [a, b] in
        print(self.a + self.b)
        print(a + b)
    }


    func run() {
        a=3
        b=3
        newClouser()
        a=4
        b=4
        newClouser()
    }
}

// Q2().run()


class Q3 {
    func run() {
        print("1")
        DispatchQueue.main.async {
            print("2")
            DispatchQueue.main.async {
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
// Q3().run()

class Q4 {
    func run() {
        print("1")
        DispatchQueue.main.async {
            print("2")
            DispatchQueue.main.sync {
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
//Q4().run()

class Q5 {
    func run() {
        let queue = DispatchQueue(label: "a.b.c")
        print("1")
        queue.async {
            print("2")
            queue.sync {
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
//Q5().run()


class Q6 {
    func run() {

        let queue1 = DispatchQueue.main
        let queue2 = DispatchQueue(label: "a.b.d")
        print("1")
        queue1.async {
            print("2")
            queue1.async {
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
//Q6().run()

class Q7 {
    func run() {

        let queue1 = DispatchQueue(label: "a.b.c")
        let queue2 = DispatchQueue(label: "a.b.D")
        print("1")
        queue1.async {
            print("2")
            queue1.async {
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
//Q7().run()

class Q8 {
    func run() {
        for i in 0...10 {
            DispatchQueue.main.async {
                DispatchQueue.main.async {
                    print("Print1",i)
                }
                print("print2",i)
            }
        }
    }
}
//Q8().run()


class Q9 {
    func run() {
        for i in 0...10 {
            DispatchQueue.main.async {
                print("s: \(i)")
                DispatchQueue.main.sync {
                    print("Print1",i)
                }
                print("Print2",i)
            }
        }
    }
}
//Q9().run()


class Q10 {
    func run() {
        for i in 0...10 {
            DispatchQueue.main.async {
                DispatchQueue.global().sync {
                    print("Print1",i)
                }
                print("Print2",i)
            }
        }
    }
}
//Q10().run()

class Q11 {
    func run() {
        for i in 0...10 {
            DispatchQueue.main.async {
                DispatchQueue.global().async {
                    print("Print1",i)
                }
                print("Print2",i)
            }
        }
    }
}
//Q11().run()

class Q12 {
    func run() {
        for i in 0...10 {
            DispatchQueue.global().async {
                DispatchQueue.global().async {
                    print("Print1",i)
                }
                print("Print2",i)
            }
        }
    }
}
//Q12().run()



//Write a code that shows thread-safety issues?
class Q13 {
    var array = [Int]()

    func run() {
        DispatchQueue.concurrentPerform(iterations: 100) { index in
            let last = array.last ?? 0
            array.append(last)
        }
    }
}
// Will result in race conditions
//Q13().run()


//Fix: Q13
class Q14 {

    let lock = NSLock()

    var array: [Int] {
        get {
            return self.pArray
        } set {
            lock.lock()
            self.pArray = newValue
            lock.unlock()
        }
    }

    private var pArray = [Int]()


    func run() {
        DispatchQueue.concurrentPerform(iterations: 100) { index in
            let last = array.last ?? 0
            array.append(last+1)
            print(index, array)
        }
    }
}
//Q14().run()


class Q16 {

    let lock = NSLock()

    var array: [Int] = [Int]()

    func run() {

        DispatchQueue.concurrentPerform(iterations: 100) { index in
            lock.lock()
            let last = array.last ?? 0
            array.append(last+1)
            print(index, array)
            lock.unlock()
        }
    }
}

//Q16().run()


class Q17 {

    func run() {
        let d = DispatchQueue(label: "a.b.c")

        print("0")
        d.async {
            print("1")
            print("100")
        }
        print("2")
        d.async {
            print("3")
            print("300")
        }
        print("4")
        d.async {
            print("5")
            print("500")
        }
        print("6")
    }
}

//Q17().run()
