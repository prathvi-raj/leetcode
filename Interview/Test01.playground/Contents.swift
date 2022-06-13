import Foundation
import Darwin

/*
 1)    Find the first & last occurrence of given element in sorted array
     Input: [1, 3, 5, 6, 6, 6, 6, 8, 9, 22], target = 6
     Output: [3, 6]

 1, 3, 5, 6, 6, 6, 6, 8, 9, 22
 [1], 6
 */

/*

class Solution {
    func indexOfNumber(_ number: Int, array: [Int]) -> Int {
        var l: Int = 0
        var r: Int = array.count - 1
        var mid: Int = array.count/2
        if array[mid] == number {
            return mid
        }

        if array[mid] > number {
            return self.indexOfNumber(number, Array(array[l..<mid]))
        }

        return self.indexOfNumber(number, Array(array[mid...r]))
    }

    func firstAndLast(_ array: [Int], target: Int) -> (Int, Int) {
        let anyOc: Int = self.indexOfNumber(target, array: array)
        var f: Int = anyOc
        var l: Int = anyOc

        while array[f] == target || array[l] == target {
            if array[f] == target {
                f -= 1
            }

            if array[l] == target {
                l += 1
            }
        }

        return (f, l)
    }
}


*/
/*
class Node {
    var val: Int?
    var next: Node?
    init(_ val: Int?) {
        self.val = val
    }
}
/*
Swap Nodes in Pair
    Input: head = [1,2,3,4]
    Output: [2,1,4,3]

 [1,2,3,4,5,6,7,8]


 1357
 */

func swapInPair(_ head: Node?) -> Node? {
    var current: Node? = head
    var next: Node? = nil
    while current != nil && current?.next != nil {
        let temp = current?.next?.next
        var a: Node? = current
        var b: Node? = current.next
        let c = b
        b = a
        a = c
        a.next = temp
        current = temp
    }
    return head.next
}
*/
