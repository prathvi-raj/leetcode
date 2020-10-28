import Foundation

/*
 You have a total of n coins that you want to form in a staircase shape, where every k-th row must have exactly k coins.

 Given n, find the total number of full staircase rows that can be formed.

 n is a non-negative integer and fits within the range of a 32-bit signed integer.

 Example 1:

 n = 5

 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤

 Because the 3rd row is incomplete, we return 2.
 Example 2:

 n = 8

 The coins can form the following rows:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤

 Because the 4th row is incomplete, we return 3.
 */

/*
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var n = n
        var i: Int = 0
        while true {
            if n <= i {
                return i
            }
            i += 1
            n = n - i
        }
        
        return i
    }
}
*/

class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        let root = sqrt(Double(8 * n + 1))
        let result = (root - 1) / 2
        
        return Int(result.rounded(.down))
    }
}

print(Solution().arrangeCoins(5))
print(Solution().arrangeCoins(8))
