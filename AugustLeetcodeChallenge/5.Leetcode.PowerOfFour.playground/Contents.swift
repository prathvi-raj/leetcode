import Foundation

/*
 Given an integer (signed 32 bits), write a function to check whether it is a power of 4.

 Example 1:

 Input: 16
 Output: true
 Example 2:

 Input: 5
 Output: false
 Follow up: Could you solve it without loops/recursion?
 */

/*
class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        var num = num
        
        if num == 1 {
            return true
        }
        
        if num < 4 {
            return false
        }
        
        while num > 1 {
            if num % 4 != 0 {
                return false
            }
            num = num / 4
        }
        
        return num == 1
    }
}
 */

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num == 1 { return true }
        
        return (num & (num-1) == 0) && (num % 3) == 1
    }
}

print(Solution().isPowerOfFour(16))
