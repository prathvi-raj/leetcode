import Foundation

/*
 https://medium.com/javarevisited/20-array-coding-problems-and-questions-from-programming-interviews-869b475b9121
 
 How do you find the missing number in a given integer array of 1 to 100? (solution)
 
 */

class Solution {
    
    func findMissingNumber(a: [Int]) -> Int {
        let s0 = (a.count*(a.count + 1))/2
        let s1 = a.reduce(0) { (r, i) -> Int in
            return r + i
        }
        return s0 - s1
    }
}
