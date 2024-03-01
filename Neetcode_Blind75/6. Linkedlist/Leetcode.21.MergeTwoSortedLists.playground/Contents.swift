import Foundation

/*

 21. Merge Two Sorted Lists
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.



 Example 1:


 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: list1 = [], list2 = []
 Output: []
 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]


 Constraints:

 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 Seen this question in a real interview before?
 1/4
 Yes
 No
 Accepted
 4M
 Submissions
 6.2M
 Acceptance Rate
 64.0%

 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

    // An additional initializer that can be used to implement nodes from an array
        public init?(_ array: [Int]) {
            guard !array.isEmpty else { return nil }
            self.val = array[0]
            var prev: ListNode = self
            for i in 1..<array.count {
                let new = ListNode(array[i])
                prev.next = new
                prev = new
            }
        }
}


class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1, let l2 = l2 else { return l1 ?? l2 }
        if l1.val <= l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}

class Solution1 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // check if list1 is nil then we return to list2
        if list1 == nil { return list2 }
        // check if list2 is nil then we return to list1
        if list2 == nil { return list1 }

        // create a variable to savehere the final result
        var result: ListNode?

        // We make a recursion to check if list1 val is < or = list2 val, if it is,
        // then we save te current min val from list1 to result and move forward to look the next min
        // val and save it in to result
        // The recursion will end then the loop will iterate through all the elements in list1 and list2 and save
        // it to result one by one starting from the lowest to highest
        if list1!.val <= list2!.val {
            result = list1
            result?.next = mergeTwoLists(list1?.next, list2)
        } else {
            result = list2
            result?.next = mergeTwoLists(list1, list2?.next)
        }
        return result
    }
}

class Solution2 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        var result = ListNode()
        var l1 : ListNode?
        var l2 : ListNode?
        if list1.val < list2.val {
            result.val = list1.val
            l1 = list1.next
            l2 = list2
        } else {
            result.val = list2.val
            l2 = list2.next
            l1 = list1
        }
        var current : ListNode? = result
        while l1 != nil && l2 != nil {
            if let _ = l1, let _ = l2 {
                if l1!.val < l2!.val {
                    current!.next = ListNode(l1!.val)
                    l1 = l1!.next
                } else {
                    current!.next = ListNode(l2!.val)
                    l2 = l2!.next
                }
            }
            current = current!.next
        }

        if l1 != nil {
            current?.next = l1
        }

        if l2 != nil {
            current?.next = l1
        }


        return result
    }
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

printList(Solution2().mergeTwoLists(ListNode(1, ListNode(2, ListNode(4))), ListNode(1, ListNode(3, ListNode(4)))))



