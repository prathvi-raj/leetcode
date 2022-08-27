import Foundation

class RandomizedSetInt {

    /// Values
    private var keys: [Int] = []

    /// Value: Index of value in keys
    private var map: [Int: Int] = [:]

    init() {}

    func insert(_ val: Int) -> Bool {
        guard map[val] == nil else { return false }
        self.map[val] = keys.count
        keys.append(val)
        return true
    }

    func remove(_ val: Int) -> Bool {
        guard let index = map[val] else { return false }
        let atLast = keys[index]
        keys[index] = keys[keys.count-1]
        keys[keys.count-1] = atLast
        map[keys[index]] = index
        keys.removeLast()
        map.removeValue(forKey: val)

        return true
    }

    func getRandom() -> Int {
        return keys.randomElement() ?? -1
    }
}


class RandomizedSet<T: Hashable> {

    /// Values
    private var keys: [T] = []

    /// Value: Index of value in keys
    private var map: [T: Int] = [:]

    init() {}

    func insert(_ val: T) -> Bool {
        guard map[val] == nil else { return false }
        self.map[val] = keys.count
        keys.append(val)
        return true
    }

    func remove(_ val: T) -> Bool {
        guard let index = map[val] else { return false }
        let atLast = keys[index]
        keys[index] = keys[keys.count-1]
        keys[keys.count-1] = atLast
        map[keys[index]] = index
        keys.removeLast()
        map.removeValue(forKey: val)

        return true
    }

    func getRandom() -> T? {
        return keys.randomElement() ?? nil
    }
}



/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */



let s = RandomizedSet<[String: Int]>()
s.insert(["1": 1])
s.remove(["1": 1])
s.insert(["2": 1])
s.getRandom()
s.remove(["12": 1])
s.insert(["1": 1])

s.getRandom()



["insert","remove","insert","getRandom","remove","insert","getRandom"]
[[1],[2],[2],[],[1],[2],[]]
