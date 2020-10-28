import Foundation

/*
 
 Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

 Example:

 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
 
 */



// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func printLinkedList(_ l: ListNode?) -> Void {
    var l = l
    while l != nil {
        print(l!.val)
        l = l?.next
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }    
    
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }
        
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
    }
    
    func mergeTwoListsA(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        if l1 == nil && l2 != nil {
            return l2
        }
        if l2 == nil && l1 != nil {
            return l1
        }
        let resultNode = ListNode(0)
        var curr = resultNode
        var list1 = l1
        var list2 = l2
        while list1 != nil || list2 != nil {
            if (list1?.val ?? Int.min) > (list2?.val ?? Int.max) {
                if list2?.val == nil {
                    curr.next = ListNode(list1?.val ?? 0)
                    list1 = list1?.next
                } else {
                    curr.next = ListNode(list2?.val ?? 0)
                    list2 = list2?.next
                }
            } else {
                if list1?.val == nil {
                    curr.next = ListNode(list2?.val ?? 0)
                    list2 = list2?.next
                } else {
                    curr.next = ListNode(list1?.val ?? 0)
                    list1 = list1?.next
                }
            }
            curr = curr.next!
        }
        return resultNode.next
    }
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(4)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

printLinkedList(Solution().mergeTwoLists(l1, l2))

