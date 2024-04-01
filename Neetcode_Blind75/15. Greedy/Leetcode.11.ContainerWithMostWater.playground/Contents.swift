import Foundation

/*
 11. Container With Most Water
 Medium
 Topics
 Companies
 Hint
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.



 Example 1:


 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 Example 2:

 Input: height = [1,1]
 Output: 1


 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104

 https://duncan-mcardle.medium.com/leetcode-problem-11-container-with-most-water-javascript-229a3b51e6e7

 https://jessijokes.medium.com/solving-the-leetcode-container-with-most-water-problem-f720c4f0dacd

 */



class Solution1 {
    func maxArea(_ height: [Int]) -> Int {

        var result: Int = 0
        for i in 0..<height.count {
            for j in (i+1)..<height.count {
                let area = (j-1)*min(height[i], height[j])
                result = max(result, area)
            }
        }

        return result
    }
}

//var maxArea = function (height) {
//    let biggestFoundArea = 0;
//
//    // Loop through every column
//    for (let i = 0; i < height.length - 1; i++) {
//        // For each column, loop through the remaining columns
//        for (let j = i + 1; j < height.length; j++) {
//            // Set the maximum height of the current area
//            const maxHeight = Math.min(height[i], height[j]);
//
//            // Calculate the current area
//            const currentArea = maxHeight * (j - i);
//
//            // Update the biggest found area
//            biggestFoundArea = Math.max(biggestFoundArea, currentArea);
//        }
//    }
//
//    return biggestFoundArea;
//};


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result: Int = 0
        var l: Int = 0
        var r: Int = height.count - 1

        while l < r {

            let area = (r-l)*min(height[l], height[r])
            result = max(result, area)

            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }

        return result
    }
}


print(Solution().maxArea([1,8,6,2,5,4,8,3,7]))
print(Solution1().maxArea([1,8,6,2,5,4,8,3,7]))
