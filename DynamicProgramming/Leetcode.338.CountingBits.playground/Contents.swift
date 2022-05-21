import Foundation

/*
 338. Counting Bits
 Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

 Example 1:

 Input: n = 2
 Output: [0,1,1]
 Explanation:
 0 --> 0
 1 --> 1
 2 --> 10
 Example 2:

 Input: n = 5
 Output: [0,1,1,2,1,2]
 Explanation:
 0 --> 0
 1 --> 1
 2 --> 10
 3 --> 11
 4 --> 100
 5 --> 101


 Constraints:

 0 <= n <= 105


 Follow up:

 It is very easy to come up with a solution with a runtime of O(n log n). Can you do it in linear time O(n) and possibly in a single pass?
 Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?
 */


class Solution {

  /// An easy recurrence for this problem is f[i] = f[i / 2] + i % 2.
  func countBits(_ num: Int) -> [Int] {
    if num < 0 {
      return []
    }

    var dp = [Int](repeatElement(0, count: num + 1))

    for i in 0...num {
      dp[i] = dp[i >> 1] + (i & 1)
    }

    return dp
  }

  func countBits2(_ num: Int) -> [Int] {
    if num < 0 {
      return []
    }
    if num == 0 {
      return [0]
    }

    var dp = [Int](repeatElement(0, count: num + 1))

    for i in 1...num {
      dp[i] = dp[i & (i - 1)] + 1
    }

    return dp
  }
}


print(Solution().countBits(20))
