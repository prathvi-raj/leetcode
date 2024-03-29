import Foundation

/*
 704. Binary Search
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1


 Constraints:

 1 <= nums.length <= 104
 -104 < nums[i], target < 104
 All the integers in nums are unique.
 nums is sorted in ascending order.
 */





class Solution0 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        if nums.count ==  1 {
            return target == nums[0] ? 0 : -1
        }
        var left: Int = 0
        var right: Int = nums.count - 1

        while left < right {
//            if nums[left] == target { return left }
//            if nums[right] == target { return right }

            let mid = ((left + right) / 2)

            if nums[mid] == target { return mid }

            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        if nums.count ==  1 {
            return target == nums[0] ? 0 : -1
        }

        var left: Int = 0
        var right: Int = nums.count - 1

        while left < right {
            let mid = ((left + right) / 2)
            if nums[mid] == target { return mid }
            if nums[mid] > target {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return nums[left] == target ? left : -1
    }
}



print(Solution().search([-1,0,5], 2))
print(Solution().search([-1,0,3,5,9,12], 9))
print(Solution().search([-1,0,3,5,9,12], 2))
