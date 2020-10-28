import Foundation

/*
 
 https://medium.com/javarevisited/20-array-coding-problems-and-questions-from-programming-interviews-869b475b9121
 
 How do you find all pairs of an integer array whose sum is equal to a given number?
 */
/*
class Solution {
    
    func pairSum(a: [Int], sum: Int) -> Int {
        var count = 0
        for i in 0..<a.count {
            for j in i+1..<a.count {
                if (a[i] + a[j] == sum) {
                    count += 1
                }
            }
        }
        return count
    }
}
 */

class Solution {
    
    func pairSum(a: [Int], sum: Int) -> Int {
        var twiceCount = 0
        var store: [Int:Int] = [:]
        
        for i in 0..<a.count {
            store[a[i]] = (store[a[i]] ?? 0) + 1
        }
        
        for i in 0..<a.count {
            
            twiceCount += store[sum-a[i]] ?? 0
            
            if (sum - a[i] == a[i]) {
                twiceCount -= 1
            }
        }
            
        
        return twiceCount/2
    }
}

Solution().pairSum(a: [1, 5, 7, -1, 5], sum: 6)
