import Foundation
/*
 https://medium.com/javarevisited/20-array-coding-problems-and-questions-from-programming-interviews-869b475b9121
 https://www.geeksforgeeks.org/find-duplicates-in-on-time-and-constant-extra-space/
 
 How do you find the duplicate number on a given integer array?
 */



class Solution {
    func findDuplicates(a: [Int]) -> Void {
        var a = a
        for i in 0..<a.count {
            if a[abs(a[i])] >= 0 {
                a[abs(a[i])] = -a[abs(a[i])]
            }else {
                print(abs(a[i]))
            }
        }
    }
}


Solution().findDuplicates(a: [1, 2, 3, 1, 3, 6, 6, 1])
