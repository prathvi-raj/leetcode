import Foundation

/*

 206. Reverse Linked List
 Given the head of a singly linked list, reverse the list, and return the reversed list.


 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 Example 2:


 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []


 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000


 Follow up: A linked list can be reversed either iteratively or recursively. Could you implement both?

 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {

        var current: ListNode? = head
        var prev: ListNode? = nil

        while current != nil {

            let next = current?.next

//            print("C:\(current?.val ?? 0)\nP:\(prev?.val ?? 0)\nN:\(next?.val ?? 0)\n")
            printList(next)
            print(">>>>>")
            
            printList(current)
            printList(prev)


            current?.next = prev
            prev = current
            current = next

            printList(next)
            printList(current)
            printList(prev)


//            print("C1:\(current?.val ?? 0)\nP1:\(prev?.val ?? 0)\nN1:\(next?.val ?? 0)\n\n")

            print("======")
        }

        return prev
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
}

let head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

Solution().reverseList(head)
