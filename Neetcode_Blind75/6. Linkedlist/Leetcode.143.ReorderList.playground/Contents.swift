import Foundation

/*
 143. Reorder List
 Solved
 Medium
 Topics
 Companies
 You are given the head of a singly linked-list. The list can be represented as:

 L0 → L1 → … → Ln - 1 → Ln
 Reorder the list to be on the following form:

 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 You may not modify the values in the list's nodes. Only nodes themselves may be changed.



 Example 1:


 Input: head = [1,2,3,4]
 Output: [1,4,2,3]
 Example 2:


 Input: head = [1,2,3,4,5]
 Output: [1,5,2,4,3]


 Constraints:

 The number of nodes in the list is in the range [1, 5 * 104].
 1 <= Node.val <= 1000

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
}

class Solution {
    func reorderList(_ head: ListNode?) {

    }

    func getMidPoint(_ head: ListNode?) -> ListNode? {
        var s = head
        var f = head

        while f != nil {
            f = f?.next?.next
            if f != nil {
                s = s?.next
            }
        }

        return s
    }
}


func printList(_ current: ListNode?) {
    var current = current
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

printList(Solution().getMidPoint(ListNode([1,2,3,4,5,6,7])))
