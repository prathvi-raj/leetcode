import UIKit


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

 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1c = l1
        var l2c = l2


        var result: ListNode? = nil
        var carry: Int = 0
        var cur = result

        while l1c != nil || l2c != nil || carry > 0 {
            let e = ((l1c?.val ?? 0) + (l2c?.val ?? 0) + carry)
            let d =  e % 10
            carry = e / 10

            let n = ListNode(d)

            if result == nil {
                result = n
                cur = result
            } else {
                cur?.next = n
            }

            cur = n

            l1c = l1c?.next
            l2c = l2c?.next
        }

        return result
    }
}

let l1 = ListNode.init(2)
l1.next = ListNode.init(4)
l1.next?.next = ListNode.init(3)

let l2 = ListNode.init(5)
l2.next = ListNode.init(6)
l2.next?.next = ListNode.init(4)



var r  = Solution().addTwoNumbers(l1, l2)

while r != nil {
    print(r!.val)
    r = r?.next
}
