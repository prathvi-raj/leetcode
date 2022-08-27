import Foundation

/*
 74. Search a 2D Matrix

 Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:

 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.


 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false


 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 */


class Solution {

    private func searchRows(_ matrix: [[Int]], _ target: Int) -> Int {
        var low: Int = 0
        var high: Int = matrix.count-1
        var mid = -1

        while low <= high {
            mid = low + (high - low)/2
            if matrix[mid][0] <= target, matrix[mid][matrix[0].count-1] >= target {
                return mid
            }

            if target < matrix[mid][0] {
                high = mid - 1
            }else {
                low = mid + 1
            }
        }
        return -1
    }

    private func searchColumns(_ matrix: [[Int]], _ target: Int, _ row: Int) -> Bool {
        var low: Int = 0
        var high: Int = matrix[row].count-1

        while low <= high {
            let mid = low + (high - low)/2
            if matrix[row][mid] == target {
                return true
            }

            if target < matrix[row][mid] {
                high = mid - 1
            }else {
                low = mid + 1
            }
        }
        return false
    }

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = self.searchRows(matrix, target)
        if row == -1 {
            return false
        }


        return self.searchColumns(matrix, target, row)
    }
}


Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)
