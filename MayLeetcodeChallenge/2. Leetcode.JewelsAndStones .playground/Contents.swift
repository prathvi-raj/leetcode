import Foundation

class Solution {
    class func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var result: Int = 0
        var types: [Character: Int] = [:]
        
        for i in J {
            types[i] = 1
        }
        
        for b in S {
            if types[b] == 1 {
                result = result + 1
            }
        }
        
        return result
    }
}


//Input: J = "aA", S = "aAAbbbb"

print(Solution.numJewelsInStones("z", "ZZ"))
