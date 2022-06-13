import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard headA != nil, headB != nil else { return nil }
        var currA = headA
        var currB = headB

        while currA?.val != currB?.val {
            currA = currA == nil ? headB : currA?.next
            currB = currB == nil ? headA : currB?.next
        }

        return currA
    }
}
