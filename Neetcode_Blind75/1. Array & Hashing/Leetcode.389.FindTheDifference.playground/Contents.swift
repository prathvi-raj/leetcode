import Foundation

/*

 389. Find the Difference
 Easy
 Topics
 Companies
 You are given two strings s and t.

 String t is generated by random shuffling string s and then add one more letter at a random position.

 Return the letter that was added to t.



 Example 1:

 Input: s = "abcd", t = "abcde"
 Output: "e"
 Explanation: 'e' is the letter that was added.
 Example 2:

 Input: s = "", t = "y"
 Output: "y"


 Constraints:

 0 <= s.length <= 1000
 t.length == s.length + 1
 s and t consist of lowercase English letters.

 */


class Solution0 {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var map: [Character: Int] = [:]
        for c in t  { map[c] = map[c, default: 0] + 1 }
        for b in s { map[b] = map[b, default: 0] - 1 }
        return map.first { $0.value == 1 }!.key
    }
}


class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let sumS = s.reduce(0, { $0 + Int($1.asciiValue!) })
        let sumT = t.reduce(0, { $0 + Int($1.asciiValue!) })

        let diff = sumT - sumS
        return Character(UnicodeScalar(diff)!)
    }
}
