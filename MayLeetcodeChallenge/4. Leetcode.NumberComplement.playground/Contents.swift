import Foundation

/*
 Given a positive integer, output its complement number. The complement strategy is to flip the bits of its binary representation.

  

 Example 1:

 Input: 5
 Output: 2
 Explanation: The binary representation of 5 is 101 (no leading zero bits), and its complement is 010. So you need to output 2.
  

 Example 2:

 Input: 1
 Output: 0
 Explanation: The binary representation of 1 is 1 (no leading zero bits), and its complement is 0. So you need to output 0.
  

 Note:

 The given integer is guaranteed to fit within the range of a 32-bit signed integer.
 You could assume no leading zero bit in the integer’s binary representation.
 This question is the same as 1009: https://leetcode.com/problems/complement-of-base-10-integer/
 */

class Solution {
    
    func findComplement(_ num: Int) -> Int {
        
        var i = 0
        var j = 0
        
        while i < num {
            print(i, j)
            i += Int(pow(2.0, Double(j)))
            j += 1
        }
        
        return i - num
    }
}

/*
class Solution {
    func findComplement(_ num: Int) -> Int {
        var n = 1
        while n <= num {
            n <<= 1
        }
        return n - num - 1
    }
}
 */

/*
class Solution {
    func findComplement(_ num: Int) -> Int {
        let lengthOfNum = Int(log2(Double(num))) + 1
        let bitMask = (1 << lengthOfNum) - 1
        return num ^ bitMask
    }
}
 */

/*
class Solution {
    func findComplement(_ num: Int) -> Int {
        return Array(num.binary).flip.decimal
    }
}

extension Int {
    
    var binary: [Int] {
        var result: [Int] = []
        var n = self
        var i: Int = 0
        if n == 0 {
            return [0]
        }
        while n > 0 {
            result.append(n%2)
            n = n/2
            i = i+1
        }
        return result.reversed()
    }
}

extension Array where Element == Int {
    
    var decimal: Int {
        let data = self
        var result = 0
        
        for i in (0..<data.count).reversed() {
            result = result + Int(2 << (i-1)) * data[data.count-1-i]
        }
        
        return result
    }
    
    var flip: [Int] {
        var result: [Int] = []
        for a in self {
            result.append(a == 1 ? 0 : 1)
        }
        return result
    }
}
*/
Solution().findComplement(5)
