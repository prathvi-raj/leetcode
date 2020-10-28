import Foundation

/*
 
 You are given an integer array nums sorted in ascending order, and an integer target.

 Suppose that nums is rotated at some pivot unknown to you beforehand (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 If target is found in the array return its index, otherwise, return -1.

  

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 Example 3:

 Input: nums = [1], target = 0
 Output: -1
  

 Constraints:

 1 <= nums.length <= 5000
 -10^4 <= nums[i] <= 10^4
 All values of nums are unique.
 nums is guranteed to be rotated at some pivot.
 -10^4 <= target <= 10^4

 
 */


class Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        let ri = indexOfRotation(nums: nums)
        
        if target <= nums[ri] && target >= nums[0] {
            return binarySearch(nums: Array(nums[0...ri]) , val: target)
        }else {
            let r = binarySearch(nums: Array(nums[ri+1...nums.count-1]) , val: target)
            if r < 0 {
                return r
            }else {
                return r + ri + 1
            }
        }
    }
    
    func indexOfRotation(nums: [Int]) -> Int {
        var s: Int = 0
        var e: Int = nums.count - 1
        
        var result = -1
        
        if nums[e] > nums[s] {
            return -1
        }
        
        while result < 0 {
            if nums[s] < nums[s+1] {
                s = s + 1
            }else {
                result = s
            }
            
            if nums[e-1] < nums[e] {
                e = e - 1
            }else {
                result = e - 1
            }
        }
        
        return result
    }
    
    func binarySearch(nums: [Int], val: Int) -> Int {
        var l: Int = 0
        var r: Int = nums.count - 1
        
        while l <= r {
            
            let m = l + (r-1)/2
            
            if nums[m] == val { return m }
            
            if nums[m] < val {
                l = m + 1
            }else {
                r = m - 1
            }
        }
        
        return -1
    }
}

//print(Solution().indexOfRotation(nums: [4,5,6,7,0,1,2]))

print(Solution().search([4,5,6,7,0,1,2], 0))
