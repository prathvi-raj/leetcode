import Foundation

/*
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.

 If there are two middle nodes, return the second middle node.

  

 Example 1:

 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 Example 2:

 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
  

 Note:

 The number of nodes in the given list will be between 1 and 100.
 */


public class ListNode {
 public var val: Int
 public var next: ListNode?
 public init() { self.val = 0; self.next = nil; }
 public init(_ val: Int) { self.val = val; self.next = nil; }
 public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }


class Solution {
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var s: ListNode? = head
        var f: ListNode? = head
        
        while f?.next != nil {
            s = s?.next
            f = f?.next?.next
        }
        
        return s
    }
}

/*
class Solution {
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        
        var currentNode: ListNode? = head
        
        if currentNode == nil {
            return nil
        }
        
        var count: Int = 0
        
        while currentNode != nil {
            count = count + 1
            currentNode = currentNode?.next
        }
        
        currentNode = head
        
        let mid: Int = (count % 2 == 0) ? ((count + 1)/2) : ((count + 3)/2)
        
        for _ in 1..<mid {
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
}
*/
