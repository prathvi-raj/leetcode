import Foundation

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 
 */

class Solution {
    
    func majorityElement(_ nums: [Int]) -> Int {
        var store: [Int: Int] = [:]
        var i: Int = 0
        
        var maxCount: Int = 0
        
        while i < nums.count ||  Float(maxCount) < (Float(nums.count)/2) {
            
            store[nums[i]] = (store[nums[i]] ?? 0) + 1
            
            if maxCount < store[nums[i]]! {
                maxCount = store[nums[i]]!
            }
            
            if Float(maxCount) > (Float(nums.count)/2) {
                return nums[i]
            }
            
            i += 1
        }
        
        return -1
    }
}
