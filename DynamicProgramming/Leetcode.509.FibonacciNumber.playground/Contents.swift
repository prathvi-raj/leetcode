import Foundation

/*
 509. Fibonacci Number
 The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

 F(0) = 0, F(1) = 1
 F(n) = F(n - 1) + F(n - 2), for n > 1.
 Given n, calculate F(n).



 Example 1:

 Input: n = 2
 Output: 1
 Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
 Example 2:

 Input: n = 3
 Output: 2
 Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
 Example 3:

 Input: n = 4
 Output: 3
 Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.


 Constraints:

 0 <= n <= 30
 */

class Solution {
  
  var map: [Int: Int] = [:]
  
  init() {
    map = [0: 0,
           1: 1,
           2: 1]
  }
  
  func fib1(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n <= 2 { return 1 }
    return fib1(n-1) + fib1(n-2)
  }
  
  func fib2(_ n: Int) -> Int {
    if n == 0 {
      return 0
    }
    if let f = map[n] {
      return f
    } else {
      let f = fib2(n-1) + fib2(n-2)
      map[n] = f
      return f
    }
  }
  
  func fib3(_ n: Int) -> Int {
    var arr = Array(repeating: 1, count: n)
    if n <= 1 { return n }
    for i in 2 ..< n {
      arr[i] = arr[i-1] + arr[i-2]
    }
    return arr[n-1]
  }
  
  func fib(_ N: Int) -> Int {
    guard N > 1 else { return N }
    var (prev, cur) = (0, 1)
    (2...N).forEach { _ in
      let tmp = prev
      prev = cur
      cur += tmp
    }
    return cur
  }
  
}

print(Solution().fib(0))
print(Solution().fib(1))
print(Solution().fib(2))
print(Solution().fib(3))
print(Solution().fib(4))
print(Solution().fib(5))
print(Solution().fib(6))
print(Solution().fib(7))
print(Solution().fib(8))
print(Solution().fib(9))
