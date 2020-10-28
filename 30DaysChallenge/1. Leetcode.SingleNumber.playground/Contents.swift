import Foundation

/*
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.

 Note:

 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

 Example 1:

 Input: [2,2,1]
 Output: 1
 Example 2:

 Input: [4,1,2,1,2,4, 3]
 Output: 4
 */

class Solution {

    class func singleNumber(_ nums: [Int]) -> Int {

        var x = 0
        for n in nums {
            print(x)
            x ^= n
            print(x)
        }

        return x
    }
}

print(Solution.singleNumber([4,1,2,1,2,4,3,3,5]))

//print(0^3)

/*
class Solution {
    
    func singleNumber(_ nums: [Int]) -> Int {
        
        var store: [Int: Int] = [:]
        
        for n in nums {
            if store[n] != nil {
                store.removeValue(forKey: n)
            }else {
                store[n] = 1
            }
        }
        
        return store.keys.first!
    }
}
*/

/*
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var store: [Int] = []
        
        for n in nums {
            if let f = store.firstIndex(of: n) {
                store.remove(at: f)
            }else {
                store.append(n)
            }
        }
        
        return store.first!
    }
}
*/
