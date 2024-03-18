import Foundation

/*

 42. Trapping Rain Water
 Solved
 Hard
 Topics
 Companies
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

        guard height.count > 1 else { return 0 }

        let n = height.count

        var lMax: [Int] = Array(repeating: 0, count: n)
        lMax[0] = height[0]

        var rMax: [Int] = Array(repeating: 0, count: n)
        rMax[n-1] = height[n-1]


        for i in 1..<n {
            lMax[i] = max(lMax[i-1], height[i])
        }

        for i in (0..<n-1).reversed() {
            rMax[i] = max(rMax[i+1], height[i])
        }

        var result: Int = 0

        print(lMax)
        print(rMax)

        for i in 0..<n {
            let l = (min(lMax[i], rMax[i]) - height[i])
            result += l >= 0 ? l : 0
        }

        return 0
    }
}


print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1]))


/*

 Intuition
 Two pointer technique rather than going with nested loops.

 Approach
 Take two pointers left and right which represents leftmost and rightmost positions of an array respectively.
 Take leftMax and rightMax to keep track of maximum heights from both the sides of array.
 If left is smaller than right then there is a potential for water to be trapped on the left side.
 If right is smaller than left then there is similar case but on the right side.
 Finally, we left and right pointers meet then we come out with the maximum water which we can trap.
 Complexity
 Time complexity: O(n)
 Space complexity: O(1)
 Code

 */


class Solution1 {
    func trap(_ height: [Int]) -> Int {
        //1
        var left = 0
        var right = height.count - 1
        //2
        var leftMax = 0
        var rightMax = 0

        var result = 0

        while left < right{
            //3
            if height[left] < height[right]{

                if height[left] > leftMax{

                    leftMax = height[left]
                }
                else{

                    result += leftMax - height[left]
                }

                left += 1
            }
            //4
            else{
                if height[right] > rightMax{

                    rightMax = height[right]
                }
                else{

                    result += rightMax - height[right]
                }

                right -= 1
            }
        }

        return result
    }
}


class Solution2 {
    func trap(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }

        var lMax: Int = height[0]
        var rMax: Int = height[height.count - 1]

        var l: Int = 0
        var r: Int = height.count - 1

        var result: Int = 0
        while l <= r {
            if lMax < rMax {
                lMax = max(lMax, height[l])
                result += max(0, lMax - height[l])
                l += 1
            } else {
                rMax = max(rMax, height[r])
                result += max(0, rMax - height[r])
                r -= 1
            }
        }
        return result
    }
}


class Solution3 {
    func trap(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }

        var lMax: Int = height[0]
        var rMax: Int = height[height.count - 1]

        var l: Int = 0
        var r: Int = height.count - 1

        var result: Int = 0
        while l < r {
            if lMax <= rMax {
                l += 1
                lMax = max(lMax, height[l])
                result += max(0, lMax - height[l])
            } else {
                r -= 1
                rMax = max(rMax, height[r])
                result += max(0, rMax - height[r])
            }
        }
        return result
    }
}
