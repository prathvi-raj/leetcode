import Foundation

/*
 Description
 There are n buildings in a line. You are given an integer array heights of size n that represents the heights of the buildings in the line.

 The ocean is to the right of the buildings. A building has an ocean view if the building can see the ocean without obstructions. Formally, a building has an ocean view if all the buildings to its right have a smaller height.

 Return a list of indices (0-indexed) of buildings that have an ocean view, sorted in increasing order.

 Example 1:

 Input: heights = [4,2,3,1]

 Output: [0,2,3]

 Explanation: Building 1 (0-indexed) does not have an ocean view because building 2 is taller.

 Example 2:

 Input: heights = [4,3,2,1]

 Output: [0,1,2,3]

 Explanation: All the buildings have an ocean view.

 Example 3:

 Input: heights = [1,3,2,4]

 Output: [3]

 Explanation: Only building 3 has an ocean view.

 Example 4:

 Input: heights = [2,2,2,2]

 Output: [3]

 Explanation: Buildings cannot see the ocean if there are buildings of the same height to its right.

 Constraints:

 1 <= heights.length <= 10^5
 1 <= heights[i] <= 10^9
 Solution
 For index i where 0 <= i < n, the building at index i has an ocean view if and only if for all i < j < n, there is heights[i] > heights[j]. Obviously, the building at index n - 1 has an ocean view.

 Loop over heights backwards and maintain the maximum height. For the building at index i, if heights[i] is greater than the maximum height, then the building has an ocean view. Update the maximum height using heights[i] after determining whether the building at index i has an ocean view.

 Finally, return the indices of buildings that have an ocean view.
 */

class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {

        var views: [Int] = []

        for i in 0..<heights.count {
            let h = heights[i]
            views.append(i)
            for j in (i+1)..<heights.count {
                if heights[j] >= h {
                    views.removeLast()
                    break
                }
            }
        }
        return views
    }
}

class Solution2 {
    func findBuildings(_ heights: [Int]) -> [Int] {
        
        var views: [Bool] = Array(repeating: false, count: heights.count)

        var maxHeight: Int = 0
        for i in (0..<heights.count).reversed() {
            if heights[i] > maxHeight {
                views[i] = true
                maxHeight = heights[i]
            }
        }

        var result: [Int] = []
        for i in 0..<views.count {
            if views[i] {
                result.append(i)
            }
        }

        return result
    }
}

print(Solution().findBuildings([4,2,3,1]))

print(Solution().findBuildings([4,3,2,1]))

print(Solution().findBuildings([1,3,2,4]))

print(Solution().findBuildings([2,2,2,2]))

print(Solution2().findBuildings([4,2,3,1]))

print(Solution2().findBuildings([4,3,2,1]))

print(Solution2().findBuildings([1,3,2,4]))

print(Solution2().findBuildings([2,2,2,2]))
