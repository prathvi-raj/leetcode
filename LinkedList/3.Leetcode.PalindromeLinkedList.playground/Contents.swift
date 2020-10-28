import Foundation
/*
 Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 Example 2:

 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 */

///  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
/*
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var head = head
        var slow: ListNode? = head
        var fast: ListNode? = head
        var n: Int = 0
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            n += 1
        }
        
        slow = self.reverse(head: slow)
        for i in 0...n {
            if slow?.val != head?.val {
                return false
            }
            slow = slow?.next
            head = head?.next
        }
        return false
    }
    
    func reverse(head: ListNode?) -> ListNode? {
        var current: ListNode? = head
        var previous: ListNode? = nil
         while current != nil {
             let tempNext: ListNode? = current?.next
             current?.next = previous
             previous = current
             current = tempNext
         }
        return previous
    }
}
 */

class Solution {
    // 1->2->3->2->1
    // 1->2->3<-2<-1
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        // find the middle node
        var fast = head, slow = head
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        // reverse the second part of ListNode
        var pre: ListNode?
        var cur = slow
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        // pre is the new head of second part
        var p = head
        while p != nil && pre != nil {
            if p!.val != pre!.val {
                return false
            }
            p = p?.next
            pre = pre?.next
        }
        return true
    }
}
