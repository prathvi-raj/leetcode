import Foundation

/*
 
 Given a positive integer num, write a function which returns True if num is a perfect square else False.

 Note: Do not use any built-in library function such as sqrt.

 Example 1:

 Input: 16
 Output: true
 Example 2:

 Input: 14
 Output: false

 */

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var x = num
        while (x * x > num) {
            x = (x + num / x) / 2;
        }
        return x * x == num
    }
}

/*
class Solution {

    func isPerfectSquare(_ num: Int) -> Bool {
        if num == 0 {
            return false
        }

        if num == 1 {
            return true
        }

        for i in 1...num/2 {
            print(i)
            if i*i == num {
                return true
            }
        }

        return false
    }
}
 */

Solution().isPerfectSquare(100000000)
