import Foundation

class RandomizedCollection {

    /// Values
    private var keys: [Int] = []

    /// Value: Index of value in keys
    private var map: [Int: Set<Int>] = [:]

    init() {}

    func insert(_ val: Int) -> Bool {
        let result = map[val, default: Set<Int>()].count == 0 ? true: false
        map[val, default: Set<Int>()].insert(keys.count)
        keys.append(val)
        return result
    }

    func remove(_ val: Int) -> Bool {
        if map[val, default: Set<Int>()].count == 0 { return false }
        let indexToRemove = map[val]!.first!
        map[val]!.remove(indexToRemove)

        if indexToRemove < keys.count-1 {
            keys.swapAt(indexToRemove, keys.count - 1)
            map[keys[indexToRemove]]!.remove(keys.count - 1)
            map[keys[indexToRemove]]!.insert(indexToRemove)
        }

        if map[val]?.isEmpty == true {
            map.removeValue(forKey: val)
        }

        keys.removeLast()

        return true
    }

    func getRandom() -> Int {
        return keys.randomElement() ?? -1
    }
}


let s = RandomizedCollection()

s.insert(1)
s.remove(1)
s.insert(1)

s.getRandom()
