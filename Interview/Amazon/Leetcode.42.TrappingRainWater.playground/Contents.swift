import Foundation

/*
 42. Trapping Rain Water

 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.



 Example 1:


 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 Example 2:

 Input: height = [4,2,0,3,2,5]
 Output: 9


 Constraints:

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 */

class Solution {
    func trap(_ height: [Int]) -> Int {

        var left: [Int] = Array(repeating: 0, count: height.count)
        var right: [Int] = Array(repeating: 0, count: height.count)

        var c = Int.min
        for i in 0..<height.count {
            left[i] = max(c, height[i])
            c = max(c, height[i])
        }

        c = Int.min
        for i in 0..<height.count {
            right[height.count - 1 - i] = max(c, height[height.count - 1 - i])
            c = max(c, height[height.count - 1 - i])
        }

        var result: Int = 0
        for i in 0..<height.count {
            result += (min(left[i], right[i]) - height[i])
        }

        return result

    }
}

Solution().trap([3,1,2,4,0,1,3,2])
