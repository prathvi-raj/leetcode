import Foundation

/*
 238. Product of Array Except Self
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

 You must write an algorithm that runs in O(n) time and without using the division operation.



 Example 1:

 Input: nums = [1,2,3,4]
 Output: [24,12,8,6]
 Example 2:

 Input: nums = [-1,1,0,-3,3]
 Output: [0,0,9,0,0]


 Constraints:

 2 <= nums.length <= 105
 -30 <= nums[i] <= 30
 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.


 Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
 */


class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var numsCopy = nums
        var multiplier = 1
        for (i, num) in numsCopy.enumerated() {
            numsCopy[i] = multiplier
            multiplier = multiplier * num
        }

        var i = numsCopy.count - 1
        multiplier = 1
        while i >= 0 {
            numsCopy[i] = numsCopy[i] * multiplier
            multiplier = nums[i] * multiplier
            i -= 1
        }
        return numsCopy
    }
}

class Solution1 {

    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result: [Int] = [Int](repeating: 1, count: nums.count)
        var multiplier = 1

        for i in 0 ..< nums.count {
            result[i] *= multiplier
            multiplier *= nums[i]
        }

        print(result)

        multiplier = 1

        for i in (0 ..< nums.count).reversed() {
            result[i] *= multiplier
            multiplier *= nums[i]
        }

        return result
    }
}

Solution1().productExceptSelf([2,3,4,5])
