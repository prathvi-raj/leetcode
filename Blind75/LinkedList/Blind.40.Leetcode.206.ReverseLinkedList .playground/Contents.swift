import Foundation

/*
 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?
 */

func swap<T>(_ a: inout T, _ b: inout T) {
    let t = a
    a = b
    b = t
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        guard let head = head  else { return nil }
        
        var p:ListNode = head
        var stack = [p]
        
        while let next = p.next {
            stack.append(next)
            p = next
        }
        
        let newHead = stack.removeLast()
        p = newHead
        while let last = stack.popLast() {
            p.next = last
            last.next = nil
            p = last
        }
        return newHead
    }
}


class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        /// Reverse the rest list and put the first element at the end/
        let node = reverseList(head?.next)
        head?.next?.next = head
        
        /// Tricky step -- see the diagram
        head?.next = nil
        
        /// fix the head pointer
        return node
    }
}

class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var next: ListNode? = nil
        var current: ListNode? = head
        var previous: ListNode? = nil
        
        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        head = previous
        return previous
    }
}

