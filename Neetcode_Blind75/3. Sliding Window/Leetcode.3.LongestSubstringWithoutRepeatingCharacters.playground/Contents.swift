import Foundation

/*
 3. Longest Substring Without Repeating Characters
 Solved
 Medium
 Topics
 Companies
 Given a string s, find the length of the longest
 substring
  without repeating characters.



 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */




class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var s = Array(s)

        var store: [Character: Int] = [:]
        var start: Int = -1
        var ml: Int = 1

        for i in 0..<s.count {
            if let l = store[s[i]], l > start {
                start = l
            }
            store[s[i]] = i
            ml = max(ml, i - start)
        }
        return ml
    }
}

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var s = Array(s)

        var map: [Character: Int] = [:]
        var l: Int = 0
        var r: Int = 0
        var result: Int = 0

        while r < s.count {
            if let m = map[s[r]] {
                map.removeValue(forKey: s[l])
                l += 1
            } else {
                map[s[r]] = r
                r += 1
                result = max(result, map.keys.count)
            }
        }
        return result
    }
}

class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var s = Array(s)

        var set = Set<Character>()
        var l: Int = 0
        var r: Int = 0
        var result: Int = 0

        while r < s.count {
            if set.contains(s[r]) {
                set.remove(s[l])
                l += 1
            } else {
                set.insert(s[r])
                r += 1
                result = max(result, set.count)
            }
        }
        return result
    }
}



//abcabcbb
//a  l 1 g 1
//ab l 2 g 2
//abc l 3 g 3
//a-bca
//a-bc-ab
//a-bc-abc


print(Solution2().lengthOfLongestSubstring("abcabcbb"))
print(Solution2().lengthOfLongestSubstring("pwwkew"))
print(Solution2().lengthOfLongestSubstring("bbbbbb"))
print(Solution2().lengthOfLongestSubstring("dvdf"))
print(Solution2().lengthOfLongestSubstring("au"))

