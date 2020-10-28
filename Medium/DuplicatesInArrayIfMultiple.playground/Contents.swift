import Foundation

/*
 
 https://medium.com/javarevisited/20-array-coding-problems-and-questions-from-programming-interviews-869b475b9121
 
 How do you find duplicate numbers in an array if it contains multiple duplicates?
 
 */

class Solution {
    func removeDuplicates(a: [Int]) -> [Int] {
        var a = a
        if a.count == 0 || a.count == 1 {
            return a
        }
        
        var j = 0
        for i in 0..<a.count-1 {
            if a[i] != a[i+1] {
                a[j] = a[i]
                j += 1
            }
        }
        a[j] = a[a.count-1]
        j += 1
        return a
    }
}
