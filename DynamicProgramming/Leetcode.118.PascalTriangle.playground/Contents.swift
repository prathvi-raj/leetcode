import Foundation

/*
 118. Pascal's Triangle
 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:




 Example 1:

 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:

 Input: numRows = 1
 Output: [[1]]

 */


class Solution {
  func generate(_ numRows: Int) -> [[Int]] {
    if numRows == 0 {
      return [[Int]]()
    }
    if numRows == 1 {
      return [[1]]
    }
    if numRows == 2 {
      return [[1],[1,1]]
    }
    var ans = [[1],[1,1]]
    for row in 2..<numRows {
      var newRow = Array(repeating: 1, count: row + 1)
      var i = 1
      while i < row {
        newRow[i] = ans[row-1][i-1] + ans[row-1][i]
        i += 1
      }
      ans.append(newRow)
    }
    return ans
  }
}

print(Solution().generate(8))
