import Foundation

/*
 
 Given a m * n matrix of ones and zeros, return how many square submatrices have all ones.

  

 Example 1:

 Input: matrix =
 [
   [0,1,1,1],
   [1,1,1,1],
   [0,1,1,1]
 ]
 Output: 15
 Explanation:
 There are 10 squares of side 1.
 There are 4 squares of side 2.
 There is  1 square of side 3.
 Total number of squares = 10 + 4 + 1 = 15.
 Example 2:

 Input: matrix =
 [
   [1,0,1],
   [1,1,0],
   [1,1,0]
 ]
 Output: 7
 Explanation:
 There are 6 squares of side 1.
 There is 1 square of side 2.
 Total number of squares = 6 + 1 = 7.
  

 Constraints:

 1 <= arr.length <= 300
 1 <= arr[0].length <= 300
 0 <= arr[i][j] <= 1
 
 */


class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var subsquares = 0
        var dp = Array(repeating:Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let value = matrix[i][j]
                guard value > 0 else { dp[i][j] = 0; continue }
                let west      = (i == 0)           ? 0 : dp[i-1][j-0]
                let northwest = (i == 0 || j == 0) ? 0 : dp[i-1][j-1]
                let north     = (j == 0)           ? 0 : dp[i-0][j-1]
                dp[i][j] = [west, northwest, north].min()! + value
                subsquares += dp[i][j]
            }
        }
        return subsquares
    }
}

let matrix = [
    [1,0,1],
    [1,1,0],
    [1,1,0]
]

Solution().countSquares(matrix)
