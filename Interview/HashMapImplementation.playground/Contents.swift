import Foundation


/*
 The Naive Array implementation

 This implementation will use a simple array as the backing.

 By using reservecapacity (which is an O(n) call) pre-allocating the space needed for the array makes sense and is performant.
 */
class MyHashMap0 {
    var arr : [Int] = []
    /** Initialize your data structure here. */
    init() {

    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if (arr.count - 1) >= key {
            arr[key] = value
        } else {
            arr.reserveCapacity(key + 1)
            for _ in arr.count-1..<key-1{
                arr.append(-1)
            }
            arr.append(value)
            print (arr)
        }
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        if(arr.count - 1) >= key {
            return arr[key]
        }
        return -1
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        if(arr.count - 1) >= key {
            arr[key] = -1
        }
    }
}


// Implementation
// Implementation
class MyHashMap {

    struct Element {
        var key: Int
        var value: Int
    }

    var buckets : [Element] = []

    /** Initialize your data structure here. */
    init() {
        buckets = Array(repeating: Element(key: -1, value: -1), count: 2)
    }

    // returns the current load factor as a decimal - 1 is full, 0 is empty
    var currentLoadFactor: Double {
        return Double(buckets.compactMap{$0}.filter{$0.key == -1}.count) / Double(buckets.count)
    }

    private func resize() {
        if currentLoadFactor > 0.9 {
            // double the capacity
            let extraBuckets: [Element] = Array(repeating: Element(key: -1, value: -1), count: buckets.count)
            buckets += extraBuckets
        } else {
            if currentLoadFactor < 0.4 {
                // remove blank buckets
                buckets.removeAll(where: { $0.key == -1 })
                resize()
            }
        }
    }

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        remove(key)
        resize()
        buckets.append(Element(key: key, value: value))
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return buckets.first{ $0.key == key }?.value ?? -1
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        buckets.removeAll(where: { $0.key == key })
    }
}



/*
 ===================================================================+++++++++++================++++++++++++=
 */

struct Placeholder<Key, Value> where Key: Hashable {
    var values: [(Key, Value)] = []

    func firstValue(matchingKey key: Key) -> Value? {
        return values.lazy.filter({ $0.0 == key }).first?.1
    }

    mutating func removeValue(key: Key) {
        values = values.filter({ $0.0 != key })
    }
}

struct Dictionary<Key, Value> where Key: Hashable {
    fileprivate var storage = Array<Placeholder<Key, Value>>(repeating: Placeholder<Key, Value>(), count: 2)

    private let maxLoadFactor = 0.7

    private var size: Int {
        return storage.count
    }

    var count: Int {
        return storage.flatMap({ $0.values }).count
    }

    var currentLoadFactor: Double {
        return Double(count) / Double(size)
    }

    mutating func set(key: Key, value: Value) {
        remove(key: key)
        let position = abs(key.hashValue) % size
        storage[position].values.append((key, value))
        resizeIfNeeded()
    }

    mutating func resizeIfNeeded() {
        if currentLoadFactor > maxLoadFactor {
            let oldDictionary = self
            storage = Array<Placeholder<Key, Value>>(repeating: Placeholder<Key, Value>(), count: size*2)
            for (key, value) in oldDictionary {
                self[key] = value
            }
        }
    }

    mutating func remove(key: Key) {
        let position = abs(key.hashValue) % size
        storage[position].removeValue(key: key)
    }

    func get(key: Key) -> Value? {
        let position = abs(key.hashValue) % size
        return storage[position].firstValue(matchingKey: key)
    }

    subscript(key: Key) -> Value? {
        get {
            return get(key: key)
        }
        set {
            if let value = newValue {
                set(key: key, value: value)
            } else {
                remove(key: key)
            }
        }
    }
}

extension Dictionary: Sequence {
    typealias Iterator = AnyIterator<(Key, Value)>
    func makeIterator() -> Dictionary.Iterator {
        var storageIterator = storage.makeIterator()
        var currentIterator: AnyIterator<(Key, Value)>?
        return AnyIterator({
            if let next = currentIterator?.next() {
                return next
            }
            if let nextPlaceholder = storageIterator.next() {
                currentIterator = AnyIterator(nextPlaceholder.values.makeIterator())
            }
            return currentIterator?.next()
        })
    }
}

var dictionary = Dictionary<String, String>()
dictionary["there"] = "asdf"
dictionary["1232"] = "asd2f"

for pair in dictionary {
    print(pair)
}

dictionary.count

dictionary["1232"]
dictionary["1232"] = nil
dictionary["1232"]
dictionary["there"]


