import Foundation

/*
 Given an array of integers, find if the array contains any duplicates.

 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

 Example 1:

 Input: [1,2,3,1]
 Output: true
 Example 2:

 Input: [1,2,3,4]
 Output: false
 Example 3:

 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let count = nums.count
        let mySet = Set(nums)
        return count > mySet.count
    }
}

/*
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var store: [Int: Int] = [:]
        for a in nums {
            if store[a] == nil {
                store[a] = 1
            }else {
                return true
            }
        }
        return false
    }
}
*/
Solution().containsDuplicate([1,2,3,4])

Solution().containsDuplicate([1,1,1,3,3,4,3,2,4,2])
