import Foundation

/*
 146. LRU Cache

 Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

 Implement the LRUCache class:

 LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
 int get(int key) Return the value of the key if the key exists, otherwise return -1.
 void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
 The functions get and put must each run in O(1) average time complexity.



 Example 1:

 Input
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 Explanation
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // cache is {1=1}
 lRUCache.put(2, 2); // cache is {1=1, 2=2}
 lRUCache.get(1);    // return 1
 lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
 lRUCache.get(2);    // returns -1 (not found)
 lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
 lRUCache.get(1);    // return -1 (not found)
 lRUCache.get(3);    // return 3
 lRUCache.get(4);    // return 4


 Constraints:

 1 <= capacity <= 3000
 0 <= key <= 104
 0 <= value <= 105
 At most 2 * 105 calls will be made to get and put.
 */


class LRUCache1 {

    private class Node {
        var key: Int
        var value: Int
        var next: Node?
        var prev: Node?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    private var head: Node?
    private var tail: Node?
    private var cache = [Int: Node]()
    private var capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    private func addNode(node: Node) {
        if head == nil && tail == nil {
            head = node
            tail = node
        } else if let prevHead = head {
            prevHead.prev = node
            node.next = prevHead
            head = node
        }
    }

    private func removeNode(node: Node) {
        if node === head && node === tail {
            head = nil
            tail = nil
        } else if node === head {
            head = node.next
            head?.prev = nil
        } else if node === tail {
            tail = node.prev
            node.prev?.next = nil
        } else {
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
    }

    func get(_ key: Int) -> Int {
        guard let node = cache[key] else { return -1 }
        removeNode(node:node)
        addNode(node:node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        let prevValue = get(key)
        if prevValue != -1 {
            head?.value = value
            return
        }
        let node = Node(key:key, value: value)
        cache[key] = node
        addNode(node: node)
        if cache.keys.count > capacity {
            if let tail = tail {
                cache[tail.key] = nil
                removeNode(node: tail)
            }
        }
    }
}


class LRUCache2 {
    var dict: [Int: Int] = [:]
    var order: [Int] = []
    var capacity: Int = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        moveToEnd(key)
        return dict[key] ?? -1
    }

    private func moveToEnd(_ key: Int) {
        if let indexV = order.firstIndex(of: key) {
            order.remove(at: indexV)
            order.append(key)
        }
    }

    func put(_ key: Int, _ value: Int) {
        if dict[key] == nil && dict.count+1 > capacity {
            let lastKey = order.first!
            dict.removeValue(forKey: lastKey)
            if let indexV = order.firstIndex(of: lastKey) {
                order.remove(at: indexV)
            }
        }

        if dict[key] != nil {
            moveToEnd(key)
        } else {
            order.append(key)
        }
        dict[key] = value
    }
}

class LRUCache {
    var len = 0,dict = [Int: Int](), recentlyVisited = [Int]()
    init(_ capacity: Int) {
        len = capacity
    }

    func get(_ key: Int) -> Int {
        if dict[key] != nil {
            changePriority(key: key)
        }
        return dict[key] ?? -1
    }

    func changePriority(key: Int){
        let index = findIndex(key: key)
        let key = recentlyVisited[index]
        recentlyVisited.remove(at: index)
        recentlyVisited.append(key)

    }

    func findIndex(key: Int) -> Int{
        return recentlyVisited.firstIndex(where: {$0 == key}) ?? 0
    }

    func put(_ key: Int, _ value: Int) {
        if dict[key] != nil {
            dict[key] = value
            changePriority(key: key)
        }
        else{
            if dict.count < len  {
                dict[key] = value
                recentlyVisited.append(key)

            }else{
                dict[recentlyVisited[0]] = nil
                recentlyVisited.remove(at: 0)

                recentlyVisited.append(key)

                dict[key] = value
            }
        }
    }
}
