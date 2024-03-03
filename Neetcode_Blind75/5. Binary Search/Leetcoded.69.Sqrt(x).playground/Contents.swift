import Foundation

/*
 69. Sqrt(x)
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.


 Example 1:

 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.


 Constraints:

 0 <= x <= 231 - 1
 Seen this question in a real interview before?
 */

class Solution0 {
    func mySqrt(_ x: Int) -> Int {
        var left: Int = 0
        var right: Int = x

        while left < right {
            let mid = left + ((right - left) / 2)
            if mid * mid > x {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left * left > x ? left - 1 : left
    }
}

class Solution {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var left: Int = 0
        var right: Int = x

        while left < right {
            let mid = left + ((right - left) / 2)
            if mid * mid > x {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left - 1
    }
}
print(Solution().mySqrt(0))
print(Solution().mySqrt(1))
print(Solution().mySqrt(2))
print(Solution().mySqrt(3))
print(Solution().mySqrt(4))
print(Solution().mySqrt(5))
print(Solution().mySqrt(6))
print(Solution().mySqrt(9))
print(Solution().mySqrt(16))
print(Solution().mySqrt(18))
