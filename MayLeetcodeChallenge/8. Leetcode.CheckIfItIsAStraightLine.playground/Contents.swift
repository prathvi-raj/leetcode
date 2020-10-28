import Foundation

/*
 
 You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.

  

  

 Example 1:



 Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
 Output: true
 Example 2:



 Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
 Output: false
 
 */

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        
        if coordinates.count <= 2 {
            return true
        }
        
        let m: Double = Double(coordinates[1][1] - coordinates[0][1]) / Double(coordinates[1][0] - coordinates[0][0])
        
        for i in 2..<coordinates.count {
            let mc: Double = Double(coordinates[i][1] - coordinates[i-1][1])/Double(coordinates[i][0] - coordinates[i-1][0])
            if m != mc {
                return false
            }
        }
        
        return true
    }
}

Solution().checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])
Solution().checkStraightLine([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]])
