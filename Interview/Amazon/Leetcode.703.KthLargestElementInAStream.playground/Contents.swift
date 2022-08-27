import Foundation

/*
 703. Kth Largest Element in a Stream

 Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Implement KthLargest class:

 KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
 int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.


 Example 1:

 Input
 ["KthLargest", "add", "add", "add", "add", "add"]
 [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
 Output
 [null, 4, 5, 5, 8, 8]

 Explanation
 KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
 kthLargest.add(3);   // return 4
 kthLargest.add(5);   // return 5
 kthLargest.add(10);  // return 5
 kthLargest.add(9);   // return 8
 kthLargest.add(4);   // return 8


 Constraints:

 1 <= k <= 104
 0 <= nums.length <= 104
 -104 <= nums[i] <= 104
 -104 <= val <= 104
 At most 104 calls will be made to add.
 It is guaranteed that there will be at least k elements in the array when you search for the kth element.

 */

class KthLargest {
    private let k: Int
    var heap: Heap<Int>

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        heap = Heap<Int>(elements: nums, sort: {
            $0 <= $1
        })
        while (heap.size > k) {
            heap.pop()
        }
    }

    func add(_ val: Int) -> Int {
        heap.push(val)
        if heap.size > k {
            heap.pop()
        }
        return heap.peek!
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

struct Heap<T: Comparable> {
    var elements = [T]()
    private var sort: (_ left: T, _ right: T) -> Bool

    public var peek: T? {
        return elements.first
    }

    public var size: Int {
        return elements.count
    }

    init(elements: [T], sort: @escaping (_ left: T, _ right: T) -> Bool) {
        self.elements = elements
        self.sort = sort
        self.build()
    }

    private mutating func build() {
        for index in stride(from: elements.count/2 - 1, through: 0, by: -1) {
            self.shiftDown(at: index)
        }
    }

    private mutating func shiftDown(at index: Int) {
        var parent = index
        while true {
            let left = self.leftChild(of: parent)
            let right = self.rightChild(of: parent)
            var candidate = parent
            if left < self.elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < self.elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }

    private mutating func shiftUp(at index: Int) {
        var candidate = index
        var parent = self.parent(of: candidate)
        while candidate > 0 && sort(elements[candidate], elements[parent]) {
            elements.swapAt(candidate, parent)
            candidate = parent
            parent = self.parent(of: candidate)
        }
    }

    public mutating func push(_ element: T) {
        elements.append(element)
        self.shiftUp(at: self.elements.count - 1)
    }

    public mutating func pop() -> T? {
        guard !elements.isEmpty else { return nil }
        elements.swapAt(0, self.elements.count - 1)
        let lastElement = self.elements.removeLast()
        self.shiftDown(at: 0)
        return lastElement
    }

    private func parent(of index: Int) -> Int {
        return (index-1)/2
    }

    private func leftChild(of index: Int) -> Int {
        return 2*index + 1
    }

    private func rightChild(of index: Int) -> Int {
        return 2*index + 2
    }
}
