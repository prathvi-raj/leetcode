import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.

 */

 //  Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1
        var l2 = l2
        
        
        var curRes: ListNode?
        var result: ListNode? = nil
        var carry: Int = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            let data = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = data / 10
            
            let newNode = ListNode(data % 10)
            
            if result == nil {
                result = newNode
                curRes = result
            }else {
                curRes?.next = newNode
                curRes = curRes?.next
            }
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        preintLinkedList(l: result)
        return result // reverse(l: result)
    }
    
    func reverse(l: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current: ListNode? = l
        
        while current != nil {
            let tempNext: ListNode? = current?.next
            current?.next = previous
            previous = current
            current = tempNext
        }
        
        return previous
    }
    
    func preintLinkedList(l: ListNode?) -> Void {
        var l = l
        while l != nil {
            print(l!.val)
            l = l?.next
        }
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)

let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

Solution().addTwoNumbers(l1, l2)
