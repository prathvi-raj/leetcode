import Foundation

/*

 205. Isomorphic Strings
 Easy
 Topics
 Companies
 Given two strings s and t, determine if they are isomorphic.

 Two strings s and t are isomorphic if the characters in s can be replaced to get t.

 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.



 Example 1:

 Input: s = "egg", t = "add"
 Output: true
 Example 2:

 Input: s = "foo", t = "bar"
 Output: false
 Example 3:

 Input: s = "paper", t = "title"
 Output: true


 Constraints:

 1 <= s.length <= 5 * 104
 t.length == s.length
 s and t consist of any valid ascii character.

 */


class Solution0 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var map: [Character: Character] = [:]
        var s = Array(s)
        var t = Array(t)
        for i in 0..<s.count {
            if let val = map[s[i]] {
                if val == t[i] { continue } else { return false }
            } else {
                if map.values.contains(t[i]) { return false } else { map[s[i]] = t[i] }
            }
        }
        return true
    }
}


class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var cmap: [Character: Character] = [:]
        var tmap: [Character: Character] = [:]
        var s = Array(s)
        var t = Array(t)
        for i in 0..<s.count {
            if let val = cmap[s[i]] {
                if val == t[i] { 
                    continue
                } else {
                    return false
                }
            } else {
                if tmap[t[i]] != nil {
                    return false
                } else {
                    cmap[s[i]] = t[i]
                    tmap[t[i]] = s[i]
                }
            }
        }
        return true
    }
}
print(Solution().isIsomorphic("badc", "baba"))
//print(Solution().isIsomorphic("paper", "title"))
//print(Solution().isIsomorphic("egg", "add"))
//print(Solution().isIsomorphic("foo", "bar"))
