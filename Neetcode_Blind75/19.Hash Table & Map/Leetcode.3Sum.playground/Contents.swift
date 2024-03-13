import Foundation

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

class Solution {

    func threeSum(_ nums: [Int]) -> [[Int]] {
        let input = nums.sorted()
        let length = input.count
        
        if length < 3 {
            return []
        }

        var set = Set<[Int]>()
        var j:Int = 1
        var k:Int = nums.count - 1
        var i : Int = 0
    
        while j < k && i < length - 2 {
            let sum = input[i] + input[j] + input[k]
            
            if sum == 0 {
                set.insert([input[i] , input[j] , input[k]])
                if k - j != 1 {
                j = j + 1
                k = k - 1
                } else {
                    j = j + 1
                }
            }else if sum < 0 {
                j = j + 1
            }else {
                k = k - 1
            }
            if j == k && i < length - 2{
                i = i + 1
                j = i + 1
                k = length - 1
            }
        }
        return Array(set)
    }
}

// [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]
/*
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = [] //
        for i in 0..<nums.count {
            let s = twoSum(nums, -nums[i], i)
            if !s.isEmpty, (i != s[0] || i != s[1]) {
                result.insert([nums[i], nums[s[0]], nums[s[1]]].sorted())
            }
        }
        return Array(result)
    }
    
    func twoSum(_ nums: [Int], _ target: Int, _ ignore: Int) -> [Int] {
        var store: [Int: Int] = [:]
        for i in 0..<nums.count {
            if ignore != i {
                if store[target - nums[i]] != nil {
                    return [store[target - nums[i]]!, i]
                }
                store[nums[i]] = i
            }
        }
        return []
    }
}
*/

//print(Solution().threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]))
print(Solution().threeSum([-1, 0, 1, 2, -1, -4, -1, 0, 1]))

[[-2, -2, 4], [-2, 0, 2], [-4, 2, 2], [-4, -2, 6], [-4, 1, 3]]
[[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]]
