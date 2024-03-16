import Foundation

/*

 349. Intersection of Two Arrays
 Easy
 Topics
 Companies
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.



 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Explanation: [4,9] is also accepted.


 Constraints:

 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000

 */


class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        let larger: [Int]
        let smaller: [Int]

        if nums1.count >= nums2.count {
            larger = nums1
            smaller = nums2
        } else {
            larger = nums2
            smaller = nums1
        }

        var lm = [Int: Int]()
        for l in larger { lm[l] = lm[l, default: 0] + 1 }

        var result = Set<Int>()
        for s in smaller {
            if lm[s] != nil { result.insert(s) }
        }
        return Array(result)
    }
}

class Solution0 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1).intersection(nums2))
    }
}

class Solution1 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

       let nums1Set = Set(nums1)
       var result: Set<Int> = []
       for num in nums2 {
           if nums1Set.contains(num) {
               result.insert(num)
           }
       }
       return Array(result)
    }
}

class Solution2 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        var lm = [Int: Int]()
        for l in nums1 { lm[l] = lm[l, default: 0] + 1 }

        var result = Set<Int>()
        for s in nums2 {
            if lm[s] != nil { result.insert(s) }
        }
        return Array(result)
    }
}
