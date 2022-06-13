import Foundation



extension Array {
    func cReduce<T>(initValue: T,  nextResult: ((Element) -> T)) -> T {
        var start: T = initValue
        for a in self {
            start = nextResult(a)
        }
        return start
    }
}


print([1,2,3,4,5].cReduce(initValue: "S:") {
    "\($0)"
})
