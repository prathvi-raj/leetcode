import Foundation

/*
protocol Shape {
    func describe() -> String
}

struct Square: Shape {
    func describe() -> String {
        return "I’m a square. My four sides have the same lengths."
    }
}

struct Circle: Shape {
    func describe() -> String {
        return "I’m a circle. I look like a perfectly round apple pie."
    }
}



func makeShape() -> some Shape {
    return Circle()
}


let shape = makeShape()
print(shape)
print(shape.describe())
// Output: I’m a circle. I look like a perfectly round apple pie.
*/

protocol Shape {
    associatedtype Color
    var color: Color { get }
    func describe() -> String
}

struct Square: Shape {
    var color: String
    func describe() -> String {
        return "I’m a square. My four sides have the same lengths."
    }
}

struct Circle: Shape {
    var color: Int
    func describe() -> String {
        return "I’m a circle. I look like a perfectly round apple pie."
    }
}


func makeShape() -> some Shape {
    return Square(color: "Yellow")
}


print(makeShape())
