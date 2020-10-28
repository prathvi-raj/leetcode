import Foundation

/*
 You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once. Find this single element that appears only once.

  

 Example 1:

 Input: [1,1,2,3,3,4,4,8,8]
 Output: 2
 Example 2:

 Input: [3,3,7,7,10,11,11]
 Output: 10
  

 Note: Your solution should run in O(log n) time and O(1) space.
 */

class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        
        var l = 0
        var r = nums.count - 1
        
        while l + 1 < r {
            let mid = (r - l) / 2 + l
              if nums[mid] == nums[mid + 1] {
                  // right side is ok
                  if (r - mid + 1) % 2 == 0 {
                      r = mid - 1
                  } else {
                      l = mid + 2
                  }
                  
              } else if nums[mid] == nums[mid - 1] {
                  if (mid + 1 - l) % 2 == 0 {
                     l = mid + 1
                  } else {
                      r = mid - 2
                  }
              } else {
                  return nums[mid]
              }
        }
        
        return nums[l]
    }
        

}

/*
class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var result: Int = -1
        var index = 0
        while index < nums.count && result == -1 {
            if index + 1 < nums.count {
                if nums[index] == nums[index+1] {
                    index += 2
                }else {
                    result = nums[index]
                }
            }else {
                result = nums[index]
            }
        }
        return result
    }
}
*/
Solution().singleNonDuplicate([3,3,7,7,10, 10, 11])
//Solution().singleNonDuplicate([3,3,7,7,10,11,11])
//Solution().singleNonDuplicate([1,1,2,3,3,4,4,8,8])
