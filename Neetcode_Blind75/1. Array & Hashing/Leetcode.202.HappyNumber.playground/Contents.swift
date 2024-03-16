import Foundation

/*

 202. Happy Number
 Solved
 Easy
 Topics
 Companies
 Write an algorithm to determine if a number n is happy.

 A happy number is a number defined by the following process:

 Starting with any positive integer, replace the number by the sum of the squares of its digits.
 Repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
 Those numbers for which this process ends in 1 are happy.
 Return true if n is a happy number, and false if not.



 Example 1:

 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 Example 2:

 Input: n = 2
 Output: false


 Constraints:

 1 <= n <= 231 - 1
 Seen this question in a real interview before?
 1/4

 */


class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        var sum = n
        while sum != 1 {
            sum = getSumOfSquares(sum)
            if set.contains(sum) { return false }
            print(sum)
            set.insert(sum)
        }
        if sum == 1 { return true }
        return set.contains(sum)
    }


    private func digitSum(_ n: Int) -> Int {
        var digits: [Int] = String(n).compactMap { Int(String($0)) }
        var sum: Int = digits.reduce(0) { partialResult, v in partialResult + (v * v) }
        return sum
    }

    func getSumOfSquares(_ num: Int) -> Int {
        var sum = 0
        var number = num

        while number > 0 {
            let digit = number % 10
            sum += digit * digit
            number /= 10
        }

        return sum
    }
}

print(Solution().isHappy(2))
