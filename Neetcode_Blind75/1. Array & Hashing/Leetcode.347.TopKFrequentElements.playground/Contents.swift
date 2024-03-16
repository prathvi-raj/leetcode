import Foundation

/*

 347. Top K Frequent Elements
 Medium
 Topics
 Companies
 Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.



 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]


 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 k is in the range [1, the number of unique elements in the array].
 It is guaranteed that the answer is unique.


 Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.

 */

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for n in nums {
            map[n] = map[n, default: 0] + 1
        }

        var x = map.map { (key: Int, value: Int) in return (key: value, value: key) }
            .reduce([(Int, Int)]()) { partialResult, pair in return partialResult + [(pair.key, pair.value)] }
        x = x.sorted(by: { a, b in a.0 > b.0 })
        
        return x[0...k].map { a in a.1 }
    }
}


