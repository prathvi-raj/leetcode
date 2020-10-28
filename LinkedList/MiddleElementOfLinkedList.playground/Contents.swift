import Foundation

/*
 
 https://medium.com/@karti479/top-50-programming-interview-questions-32e73bec817f
 
 How do you find the middle element of a singly linked list in one pass? (solution)
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    
    /* Function to print middle of linked list */
    func middle(head: ListNode?) -> Void {
        var slow: ListNode? = head
        var fast: ListNode? = head
        if head != nil {
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
        }
        
        print(slow?.val ?? "nil")
    }
}



