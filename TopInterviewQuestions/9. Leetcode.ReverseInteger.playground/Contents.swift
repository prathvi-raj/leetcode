import Foundation

/*
 Given a 32-bit signed integer, reverse digits of an integer.

 Example 1:

 Input: 123
 Output: 321
 Example 2:

 Input: -123
 Output: -321
 Example 3:

 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */


class Solution {
    
    func reverse(_ x: Int) -> Int {
        
        if x < 10 && x >= 0 {
            return x
        }
        
        var t = abs(x)
        var store: [Int] = []
        
        while t != 0 {
            store.append(t % 10)
            t = t / 10
        }
        
        print(store)
        
        for i in 0..<store.count {
            t += Int(pow(Double(10), Double(store.count - 1 - i))) * store[i]
        }
        
        if x < 0 {
            t = t * -1
        }
        
        if abs(t) > Int32.max {
            return 0
        }
        
        return t
    }
}


Solution().reverse(1534236469)

//print(Int(pow(-2, Double(31))))
//print(Int(pow(2, Double(31))))
//
//print(1534236469 < 2147483648)
