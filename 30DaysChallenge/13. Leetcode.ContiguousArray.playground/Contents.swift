import Foundation

/*
 
  Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

  Example 1:
  Input: [0,1]
  Output: 2
  Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
  Example 2:
  Input: [0,1,0]
  Output: 2
  Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
  Note: The length of the given binary array will not exceed 50,000.
 
 */

// https://www.geeksforgeeks.org/largest-subarray-with-equal-number-of-0s-and-1s/

class Solution {
    
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var store: [Int: Int] = [:]
        
        var tnums = nums
        
        for i in 0..<nums.count {
            tnums[i] = nums[i] == 0 ? -1 : 1
        }
        
        var sum = 0 // Initialize sum of elements
        var maxLen = 0 // Initialize result
        
        for e in 0..<tnums.count {
            print(store)
            sum = sum + tnums[e]
            
            // To handle sum=0 at last index
            if sum == 0 {
                maxLen = e + 1
             }
            
            // If this sum is seen before, then update maxLen
            // if required
            
            if store[sum + nums.count] != nil {
                if maxLen < e - store[sum + nums.count]! {
                    maxLen = e - store[sum + nums.count]!
                }
            }else {
                store[sum + nums.count] = e
            }
        }
        
        return maxLen
    }
}

print(Solution().findMaxLength([0,1,0,1]))
