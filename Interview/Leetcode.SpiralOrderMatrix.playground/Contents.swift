import Foundation

/*
 Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.



 Example 1:


 Input: n = 3
 Output: [[1,2,3],[8,9,4],[7,6,5]]
 Example 2:

 Input: n = 1
 Output: [[1]]


 Constraints:

 1 <= n <= 20
 */

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {

        var result = Array(repeating: Array(repeating: 0, count: n), count: n)


        var row = 0, col = 0, rowMin = 0, colMin = 0, rowMax = n-1, colMax = n-1

        var i = 1
        while i<=n*n {

            // Go right
            while(col<=colMax) {
                result[row][col] = i
                i += 1
                col += 1
            }

            // reset to cell below last one
            col -= 1
            row += 1
            rowMin += 1 // will never update cells in and above this row again

            // Go Down
            while(row<=rowMax) {
                result[row][col] = i
                i += 1
                row += 1
            }

            // Reset to cell to left of last
            row -= 1
            col -= 1
            colMax -= 1 // will never update cells in and to the right of this column again

            // Go left
            while(col>=colMin) {
                result[row][col] = i
                i += 1
                col -= 1
            }

            // reset to the cell above last
            col += 1
            row -= 1
            rowMax -= 1 // will never update cells in and below this row again

            // Go up
            while(row>=rowMin) {
                result[row][col] = i
                i += 1
                row -= 1
            }

            row += 1
            col += 1
            colMin += 1 // will never update cells in and to the left of this column again

        }
        return result
    }
}


Solution().generateMatrix(4)
