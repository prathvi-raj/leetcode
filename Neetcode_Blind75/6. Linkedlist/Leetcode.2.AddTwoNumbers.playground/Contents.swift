import Foundation

/*
 2. Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.



 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]


 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 Seen this question in a real interview before?

 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

    // An additional initializer that can be used to implement nodes from an array
        public init?(_ array: [Int]) {
            guard !array.isEmpty else { return nil }
            self.val = array[0]
            var prev: ListNode = self
            for i in 1..<array.count {
                let new = ListNode(array[i])
                prev.next = new
                prev = new
            }
        }

    func describe() {
        var current: ListNode? = self
        var res: String = ""
        while current != nil && current?.val != nil {
            res = res + "\(current!.val)"
            current = current?.next
        }
        if res.isEmpty {
            print("-----")
        }else {
            print(res)
        }
    }
}


class Solution0 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil && l2 != nil else { return l1 ?? l2 }

        var l1c = l1
        var l2c = l2
        var c: ListNode? = nil
        var d: Int = 0

        var result: ListNode?

        while l1c != nil || l2c != nil || d != 0 {
            let s = ((l1c?.val ?? 0) + (l2c?.val ?? 0) + d)
            d = s/10
            
            let node = ListNode(s%10)
            if result == nil {
                result = node
            } else {
                c?.next = node
            }
            
            c = node

            l1c = l1c?.next
            l2c = l2c?.next
        }
        return result
    }
}

class Solution {
    private var dig = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && dig == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
        dig = sum / 10
        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}

print(Solution().addTwoNumbers(ListNode([2,4,3]), ListNode([5,6,4]))?.describe())
