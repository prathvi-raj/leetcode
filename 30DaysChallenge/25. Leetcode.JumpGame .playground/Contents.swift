import Foundation

/*
 Given an array of non-negative integers, you are initially positioned at the first index of the array.

 Each element in the array represents your maximum jump length at that position.

 Determine if you are able to reach the last index.

  

 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.
  

 Constraints:

 1 <= nums.length <= 3 * 10^4
 0 <= nums[i][j] <= 10^5
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count != 0 else { return true }
        
        var maxDis = 0
        for (index, range) in nums.enumerated() {
            if maxDis < index { return false } // check if there is any gap in the middle way
            maxDis = max(maxDis, index+range)  // update maxDis each time if necessary
        }
        return true
    }
}

/*
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        
        if nums[0] == 0 && nums.count > 1 {
            return false
        }
        
        if nums.count < 2 {
            return true
        }
        
        var index = 0
        var n = nums[0]
        
        if index + 1 + n >= nums.count {
            return true
        }
        
        while index < nums.count {
            
            if index + 1 + n >= nums.count {
                return true
            }
            
            if n == 0 {
                return false
            }
            
            let sub = Array(nums[index+1...index+n])
            let (h, hs) = self.perform(v: sub)
            print(h, hs)
            
            n = sub[h]
            index += h + 1
            
            if (sub[h] - sub[hs] <= hs - h ) {
                n = sub[hs]
                index += hs + 1
            }
            
            if index + n > nums.count {
                return true
            }
        }
        
        return false
    }
    
    func perform(v: [Int]) -> (Int, Int) {
        
        var hi: Int = 0
        var shi: Int = 0
        
        var h: Int = Int.min
        var sh: Int = Int.min
        
        for a in 0..<v.count {
            let i = v[a]
            if i >= sh {
                if i >= h {
                    sh = h
                    shi = hi
                    h = i
                    hi = a
                }else {
                    sh = i
                    shi = a
                }
            }
        }
        
        return (hi, shi)
    }
}
 */

/*
 extension Array where Element: Comparable {
    var indexOfMax: Index? {
       guard var maxValue = self.first else { return nil }
       var maxIndex = 0

       for (index, value) in self.enumerated() {
          if value >= maxValue {
             maxValue = value
             maxIndex = index
          }
      }

      return maxIndex
    }
 }

 class Solution {
     func canJump(_ nums: [Int]) -> Bool {
         
         if nums[0] == 0 && nums.count > 1 {
             return false
         }
         
         if nums.count < 2 {
             return true
         }
         
         var index = 0
         var n = nums[0]
         
         if index + 1 + n >= nums.count {
             return true
         }
         
         while index < nums.count {
             
             if index + 1 + n >= nums.count {
                 return true
             }
             
             if n == 0 {
                 return false
             }
             
             let ar = Array(nums[index+1...index+n])
             let v = Array(nums[index+1...index+n]).indexOfMax
             
             n = ar[v!]
             index += v! + 1
             
             if index + n > nums.count {
                 return true
             }
         }
         
         return false
     }
 }
 */

//Solution().canJump([2,3,1,1,4])
Solution().canJump([3,2,1,0,4])
//Solution().canJump([4,2,0,0,1,1,4,4,4,0,4,0])
//Solution().canJump([5,9,3,2,1,0,2,3,3,1,0,0])
//Solution().canJump([4,0,4,2,2,0,1,3,3,0,3])
