import Foundation

/*
 
 How do you check if a given linked list contains a cycle? How do you find the starting node of the cycle?
 
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
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = slow?.next
        
        while slow != nil && fast != nil{
            if slow === fast{
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}
