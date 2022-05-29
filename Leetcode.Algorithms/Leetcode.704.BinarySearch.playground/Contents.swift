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


class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
      self.binarySearch(nums, l: 0, r: nums.count-1, target: target)
    }

  private func binarySearch(_ nums: [Int], l: Int, r: Int, target: Int) -> Int {
    if r >= l {
      let mid: Int = l + (r-1)/2

      if nums[mid] == target { return mid }


      if nums[mid] > target {
        return self.binarySearch(nums, l: l, r: mid-1, target: target)
      }

      return self.binarySearch(nums, l: mid + 1, r: r, target: target)
    }
    return -1
  }
}



print(Solution().search([-1,0,3,5,9,12], 9))
print(Solution().search([-1,0,3,5,9,12], 2))
