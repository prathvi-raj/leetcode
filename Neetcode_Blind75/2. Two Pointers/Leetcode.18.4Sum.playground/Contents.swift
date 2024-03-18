import Foundation

/*

 18. 4Sum
 Solved
 Medium
 Topics
 Companies
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.



 Example 1:

 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 Example 2:

 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]


 Constraints:

 1 <= nums.length <= 200
 -109 <= nums[i] <= 109
 -109 <= target <= 109

 */


class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        var result = Set<[Int]>()
        var nums = nums.sorted()

        for a in 0..<nums.count - 2 {
            for b in a + 1..<nums.count - 1 {
                var c = b + 1
                var d = nums.count - 1
                while c < d {
                    let sum = nums[a] + nums[b] + nums[c] + nums[d]
                    if sum == target {
                        result.insert([nums[a], nums[b], nums[c], nums[d]])
                    }
                    if sum < target {
                        c += 1
                    } else  {
                        d -= 1
                    }
                }
            }
        }
        return Array(result)
    }
}
