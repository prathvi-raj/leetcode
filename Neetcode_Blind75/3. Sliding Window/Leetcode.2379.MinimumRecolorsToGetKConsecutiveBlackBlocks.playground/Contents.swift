import Foundation

/*
 2379. Minimum Recolors to Get K Consecutive Black Blocks
 You are given a 0-indexed string blocks of length n, where blocks[i] is either 'W' or 'B', representing the color of the ith block. The characters 'W' and 'B' denote the colors white and black, respectively.

 You are also given an integer k, which is the desired number of consecutive black blocks.

 In one operation, you can recolor a white block such that it becomes a black block.

 Return the minimum number of operations needed such that there is at least one occurrence of k consecutive black blocks.



 Example 1:

 Input: blocks = "WBBWWBBWBW", k = 7
 Output: 3
 Explanation:
 One way to achieve 7 consecutive black blocks is to recolor the 0th, 3rd, and 4th blocks
 so that blocks = "BBBBBBBWBW".
 It can be shown that there is no way to achieve 7 consecutive black blocks in less than 3 operations.
 Therefore, we return 3.
 Example 2:

 Input: blocks = "WBWBBBW", k = 2
 Output: 0
 Explanation:
 No changes need to be made, since 2 consecutive black blocks already exist.
 Therefore, we return 0.


 Constraints:

 n == blocks.length
 1 <= n <= 100
 blocks[i] is either 'W' or 'B'.
 1 <= k <= n
 

 WBBWWBBWBW


 */


class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        if blocks.isEmpty {
            return 0
        }

        if blocks.count == 1 {
            return blocks == "W" ? 1 : 0
        }

        var blocks = Array(blocks)
        var left: Int = 0
        var right: Int = 0
        var result: Int = Int.max

        var ws: Int = 0
        var bs: Int = 0

        var map: [Int: Character] = [:]

        while left <= blocks.count - k {
            if right < left+k {
                map[right] = blocks[right]
                if blocks[right] == Character("W") { ws += 1 } else {  bs += 1 }
                if map.count == k {
                    result = min(result, ws)
                }
                right += 1
            } else {
                if blocks[left] == Character("W") { ws -= 1 } else {  bs -= 1 }
                map.removeValue(forKey: left)
                left += 1
            }
        }
        return result
    }
}

print(Solution().minimumRecolors("WBBWWBBWBW", 7))
//print(Solution().minimumRecolors("WBWBBBW", 2))
//print(Solution().minimumRecolors("BWWWBB", 6))

