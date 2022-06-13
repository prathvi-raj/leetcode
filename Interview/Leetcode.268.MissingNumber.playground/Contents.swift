import Foundation

/*
 268. Missing Number

 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.



 Example 1:

 Input: nums = [3,0,1]
 Output: 2
 Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
 Example 2:

 Input: nums = [0,1]
 Output: 2
 Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
 Example 3:

 Input: nums = [9,6,4,2,3,5,7,0,1]
 Output: 8
 Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.


 Constraints:

 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 All the numbers of nums are unique.
 */


class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let s = nums.reduce(0, +)
        return (((nums.count+1)*(nums.count))/2) - s
    }

    func missingNumber1(_ nums: [Int]) -> Int {
        let numsSet = Set(nums)
        for i in 0 ... nums.count where !numsSet.contains(i) {
            return i
        }

        fatalError("It's impossible to get here")
    }
}

print(Solution().missingNumber([9,6,4,2,3,5,7,0,1]))


class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var current: ListNode? = head
        var next: ListNode? = nil
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
}

/*
 1
 12
 123
 1234
 12345
 123456
 1234567
 */

class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head?.next
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }

    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }

        var slow = head
        var fast = head

        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }

        return false
     }
}


