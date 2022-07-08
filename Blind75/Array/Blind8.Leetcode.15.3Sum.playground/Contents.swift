import Foundation

/*
 15. 3Sum
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.



 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Example 2:

 Input: nums = []
 Output: []
 Example 3:

 Input: nums = [0]
 Output: []


 Constraints:

 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        for i in 0..<nums.count {
            let twos = self.twoSum(nums, -nums[i], i)
            if !twos.isEmpty {
                result.append([i, twos[0], twos[1]])
            }
        }
        return Array(Set(result))
    }

    func twoSum(_ nums: [Int], _ target: Int, _ ignoreIndex: Int) -> [Int] {
        var map: [Int: Int] = [:]

        for i in 0..<nums.count {
//            if i == ignoreIndex { continue }
            if let last = map[target-nums[i]] {
                return [last, i]
            }else {
                map[nums[i]] = i
            }
        }

        return []
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4]))

