import Foundation

/*

 387. First Unique Character in a String
 Solved
 Easy
 Topics
 Companies
 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.



 Example 1:

 Input: s = "leetcode"
 Output: 0
 Example 2:

 Input: s = "loveleetcode"
 Output: 2
 Example 3:

 Input: s = "aabb"
 Output: -1


 Constraints:

 1 <= s.length <= 105
 s consists of only lowercase English letters.

 */


class Solution0 {
    func firstUniqChar(_ s: String) -> Int {
        let chars = Array(s)
        var store: [Character: Int] = [:]

        for i in 0..<chars.count { store[chars[i]] = (store[chars[i]] ?? 0) + 1 }
        for a in 0..<s.count { if store[chars[a]]! == 1 { return a } }

        return -1
    }
}


class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var arr = Array(repeating: 0, count: 26)
        let a = UnicodeScalar("a").value
        s.unicodeScalars.forEach {
            arr[Int($0.value - a)] += 1
        }
        var iter = 0
        for ch in s.unicodeScalars {
            if arr[Int(ch.value - a)] == 1 { return iter }
            iter += 1
        }
        return -1
    }
}
