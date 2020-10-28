import Foundation

/*
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 
0 2
 
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

class Solution {
    class func moveZeroes(_ nums: inout [Int]) {
        var places: [Int] = []
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                places.append(i)
            }
        }
        
        var c: Int = 0
        for p in places {
            nums.remove(at: p-c)
            nums.append(0)
            c += 1
        }
    }
}


/*
class Solution {
    class func moveZeroes(_ nums: inout [Int]) {
        var c: Int = 0
        var nonZeros: [Int] = []
        for i in 0..<nums.count {
            if nums[i] == 0 {
                c += 1
            }else {
                nonZeros.append(nums[i])
            }
        }
        nums = nonZeros
        
        nums.append(contentsOf: Array(repeating: 0, count: c))
    }
}
 */

var a: [Int] = [0,1,0,3,12]
Solution.moveZeroes(&a)
print(a)
