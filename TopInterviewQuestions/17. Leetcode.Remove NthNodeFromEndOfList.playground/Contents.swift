import Foundation

/*
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
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
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummyNode = ListNode(0)
        dummyNode.next = head
        
        var tempNode = head
        
        var count: Int = 0
        
        while tempNode != nil {
            tempNode = tempNode?.next
            count += 1
        }
        
        count = count - n
        
        tempNode = dummyNode
        
        while count > 0 {
            tempNode = tempNode?.next
            count -= 1
        }
        
        tempNode?.next = tempNode?.next?.next
        
        return dummyNode.next
    }
}

/*
class Solution {
    
    /// Function to delete the nth node from the end of the given linked list
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var head = head
        
        /// First pointer will point to the head of the linked list
        var first: ListNode? = head
        
        //// Second pointer will poin to the Nth node from the beginning
        var second: ListNode? = head
        
        for i in 0..<n {
            
            /// If count of nodes in the given linked list is <= N
            if second?.next == nil {
                
                // If count = N i.e. delete the head node
                if (i == n - 1) { head = head?.next }
                    
                return head
            }
            
            second = second?.next
        }
        
        /// Increment both the pointers by one until second pointer reaches the end
        while second?.next != nil {
            first = first?.next
            second = second?.next
        }
        
        /// First must be pointing to the Nth node from the end by now So, delete the node first is pointing to
        first?.next = first?.next?.next
        
        return head
    }
}
*/
