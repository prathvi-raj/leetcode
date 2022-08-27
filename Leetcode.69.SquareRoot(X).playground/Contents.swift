import Foundation

/*
 69. Sqrt(x)
 
 Given a non-negative integer x, compute and return the square root of x.

 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

 Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.

  

 Example 1:

 Input: x = 4
 Output: 2
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
  

 Constraints:

 0 <= x <= 231 - 1
 */


class Solution {
    func mySqrt(_ x: Int) -> Int {
        var i = 0
        while i*i <= x {
            i += 1
        }
        
        return i-1
    }
}


class Solution2 {
    func mySqrt(_ x: Int) -> Int {
        var left = 1, right = x
        while left != right {
            let middle = (left + right) / 2
            if middle * middle <= x {
                if (middle + 1) * (middle + 1) > x {
                    return middle
                }
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        return left
    }
}






print(Solution().mySqrt(8))
print(Solution2().mySqrt(8))
