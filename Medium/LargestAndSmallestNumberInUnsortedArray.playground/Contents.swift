import Foundation
/*
 https://medium.com/javarevisited/20-array-coding-problems-and-questions-from-programming-interviews-869b475b9121
 LargestAndSmallestNumberInUnsortedArray
 
 How do you find the largest and smallest number in an unsorted integer array?
 */

class Solution {
    
    func largestAndSmallestNumber(a: [Int]) -> (Int, Int) {
        var l: Int = a[0] // Int.max
        var h: Int = a[0] // Int.min
        
        for i in a {
            if i >= h {
                h = i
            }
            
            if i <= l {
                l = i
            }
        }
        
        return (h, l)
    }
}


Solution().largestAndSmallestNumber(a: [4,1,2,3,6])
