import Foundation

/*
 Given a sorted linked list, delete all duplicates such that each element appear only once.

 Example 1:

 Input: 1->1->2
 Output: 1->2
 Example 2:

 Input: 1->1->2->3->3
 Output: 1->2->3
 */


func printLinkedList(l: ListNode?) -> Void {
    var l = l
    while l != nil {
        print(l!.val)
        l = l?.next
    }
}


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let result = head
        var head = head
        while head?.next != nil {
            if (head?.val ?? 0) == (head?.next?.val ?? 0) {
                head?.next = head?.next?.next
            }else {
                head = head?.next
            }
        }
        return result
    }
}

let l1 = ListNode(2)
l1.next = ListNode(3)
l1.next?.next = ListNode(3)
l1.next?.next?.next = ListNode(4)

printLinkedList(l: Solution.init().deleteDuplicates(l1))
