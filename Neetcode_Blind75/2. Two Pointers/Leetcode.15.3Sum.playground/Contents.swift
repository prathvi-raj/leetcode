import Foundation

/*

 15. 3Sum
 Solved
 Medium
 Topics
 Companies
 Hint
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.



 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 Example 2:

 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 Example 3:

 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.


 Constraints:

 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105

 */


class Solution0 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        var result = Set<[Int]>()

        for i in 0 ..< sortedNums.count {
            var j = i + 1
            var k = sortedNums.count - 1
            while j < k {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
                if sum == 0 {
                    result.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                    j += 1
                    k -= 1
                } else if sum < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }

        return Array(result)
    }
}

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var answer: [[Int]] = []

        // Sort the input array to make the search process efficient.
        let sortedNums = nums.sorted()

        for i in 0..<sortedNums.count where (i == 0 || sortedNums[i] != sortedNums[i-1]) {
            var j = i + 1
            var k = sortedNums.count - 1

            // Use two-pointers technique to find triplets that sum to zero.
            while j < k {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]

                if sum == 0 {
                    // Add the triplet to the answer.
                    answer.append([sortedNums[i], sortedNums[j], sortedNums[k]])

                    // Skip duplicates for the second and third elements.
                    repeat { j += 1 } while (j < k && sortedNums[j] == sortedNums[j-1])
                    repeat { k -= 1 } while (j < k && sortedNums[k] == sortedNums[k+1])
                } else {
                    // Adjust pointers based on the sum.
                    sum > 0 ? (k -= 1) : (j += 1)
                }
            }
        }

        return answer
    }
}
