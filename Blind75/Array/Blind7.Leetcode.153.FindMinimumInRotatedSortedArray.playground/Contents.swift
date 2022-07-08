import Foundation

/*
 153. Find Minimum in Rotated Sorted Array
 Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

 [4,5,6,7,0,1,2] if it was rotated 4 times.
 [0,1,2,4,5,6,7] if it was rotated 7 times.
 Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

 Given the sorted rotated array nums of unique elements, return the minimum element of this array.

 You must write an algorithm that runs in O(log n) time.



 Example 1:

 Input: nums = [3,4,5,1,2]
 Output: 1
 Explanation: The original array was [1,2,3,4,5] rotated 3 times.
 Example 2:

 Input: nums = [4,5,6,7,0,1,2]
 Output: 0
 Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
 Example 3:

 Input: nums = [11,13,15,17]
 Output: 11
 Explanation: The original array was [11,13,15,17] and it was rotated 4 times.


 Constraints:

 n == nums.length
 1 <= n <= 5000
 -5000 <= nums[i] <= 5000
 All the integers of nums are unique.
 nums is sorted and rotated between 1 and n times.
 */

// [3,4,5,1,2]

// [7,8,9,1,2,3,4,5,6]
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1

        while start < end {
            let mid = start + (end - start) / 2
            if nums[mid] > nums[end] {
                start = mid + 1
            } else {
                end = mid
            }
        }

        return nums[start]
    }
}

class Solution1 {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        guard nums.count > 1 else { return nums[0] }

        var left = 0
        var right = nums.count - 1
        // not rotated
        guard nums[left] > nums[right] else { return nums[0] }

        while left <= right {
            let mid = (left  + right) / 2

            if nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }

            if nums[mid - 1] > nums[mid] {
                return nums[mid]
            }

            if nums[mid] > nums[0] {
                left = mid + 1
            } else if nums[mid] < nums[0] {
                right = mid - 1
            }
        }

        return -1 // not found
    }
}


class Solution3 {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        if nums.count == 2 { return min(nums[0], nums[1]) }

        var mn = Int.max
        let count = nums.count
        var p1 = 0
        var p2 = count - 1
        while p1 <= p2 {
            let mid = p1 + (p2 - p1) / 2
            if nums[mid] >= nums[p1] {
                mn = min(mn, nums[p1])
                p1 = mid + 1
            } else {
                mn = min(mn, nums[mid])
                p2 = mid - 1
            }
        }
        return mn
    }
}

class Solution4 {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            let middle = (left + right) / 2
            if nums[middle] < nums[right] {
                right = middle
            } else {
                left = middle + 1
            }
        }
        return nums[left]
    }
}

//Solution().findMin([7,8,9,1,2,3,4,5,6])
//Solution().findMin([3,4,5,1,2])
Solution().findMin([4,5,6,7,0,1,2])
