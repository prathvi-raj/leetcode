import Foundation

/*
 Write an algorithm to determine if a number n is "happy".

 A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

 Return True if n is a happy number, and False if not.

 Example:

 Input: 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

class Solution {
    
    class func isHappy(_ n: Int) -> Bool {
        
        var number = n
        
        var s = 0
        
        while number > 0 {
            let remainder = number % 10
            number = number / 10
            s += remainder * remainder
        }
        
        if s == 1 {
            return true
        }
        
        if s == 4 {
            return false
        }
        
        return isHappy(s)
    }
}

/*
class Solution {
    
    class func isHappy(_ n: Int) -> Bool {
        
        let digits = String(describing: n).compactMap { Int(String($0)) }
        
        print(digits)
        
        let s = digits.reduce(0) { (r, i) -> Int in return r + (i*i) }
        
        print(s)
        
        if s == 1 {
            return true
        }
        
        if s == 4 {
            return false
        }
        
        return isHappy(s)
    }
}
*/

Solution.isHappy(19)
