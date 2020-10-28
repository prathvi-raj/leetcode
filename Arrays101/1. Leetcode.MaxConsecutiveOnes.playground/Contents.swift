import Foundation

/*

 Given a binary array, find the maximum number of consecutive 1s in this array.

 Example 1:
 Input: [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s.
     The maximum number of consecutive 1s is 3.
 Note:

 The input array will only contain 0 and 1.
 The length of input array is a positive integer and will not exceed 10,000
 
 */

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var localMax: Int = 0
        var globalMax: Int = 0
        
        for i in 0..<nums.count {
            if nums[i] == 1 {
                localMax += 1
            }else {
                localMax = 0
            }
            if localMax > globalMax {
                globalMax = localMax
            }
        }
        
        return globalMax
    }
}

Solution().findMaxConsecutiveOnes([1,1,0,1,1,1])
