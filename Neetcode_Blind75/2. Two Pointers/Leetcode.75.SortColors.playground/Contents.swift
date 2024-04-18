import Foundation

/*

 75. Sort Colors
 Solved
 Medium
 Topics
 Companies
 Hint
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

 You must solve this problem without using the library's sort function.



 Example 1:

 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Example 2:

 Input: nums = [2,0,1]
 Output: [0,1,2]


 Constraints:

 n == nums.length
 1 <= n <= 300
 nums[i] is either 0, 1, or 2.


 Follow up: Could you come up with a one-pass algorithm using only constant extra space?

 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var l: Int = 0
        var r: Int = nums.count - 1
        var mid: Int = 0
        while mid <= r {
            switch nums[mid] {
            case 2:
                (nums[mid], nums[r]) = (nums[r], nums[mid])
                r -= 1
            case 1:
                mid += 1
            case 0:
                (nums[mid], nums[l]) = (nums[l], nums[mid])
                l += 1
                mid += 1

            default: continue
            }
        }
    }
}

class Solution1 {
    // - Complexity:
    //   - time: O(n), where n is the length of the nums.
    //   - space: O(1), only constant space is used.

    func sortColors(_ nums: inout [Int]) {
        var zeroIndex = 0
        var twoIndex = nums.count - 1
        var i = 0

        while i <= twoIndex {
            if nums[i] == 0, i > zeroIndex {
                nums.swapAt(i, zeroIndex)
                zeroIndex += 1

            } else if nums[i] == 2, i < twoIndex {
                nums.swapAt(i, twoIndex)
                twoIndex -= 1

            } else {
                i += 1
            }
        }
    }

}
