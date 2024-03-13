import Foundation

/*
 3. Longest Substring Without Repeating Characters

 Given a string s, find the length of the longest substring without repeating characters.



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
class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        var s = Array(s)

        var store: [Character: Int] = [:]
        var start: Int = -1
        var result: Int = 1

        for i in 0..<s.count {
            if let j = store[s[i]], j > start {
                start = j
            }

            store[s[i]] = i
            result = max(result, i - start)
        }

        return result
    }
}


Solution2().lengthOfLongestSubstring("abcabcbb")




class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }

        var map: [Character: Int] = [:]
        var left: Int = 0
        var right: Int = 0

        var result: Int = 0

        let s = Array(s)

        while right < s.count {
            print(map, left, right)
            if let index = map[s[right]] {
                left = max(index + 1, left )
            }
            map[s[right]] = right
            result = max(result, right - left + 1)
            right += 1
        }
        return result
    }
}

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        var charSet: Set<Character> = []

        var left: Int = 0
        var right: Int = 0

        var result = 0

        while right < chars.count {
            print(charSet, left, right)
            if !charSet.contains(chars[right]) {
                charSet.insert(chars[right])
                right += 1
                result = max(charSet.count, result)
            }else {
                charSet.remove(chars[left])
                left += 1
            }
        }
        return result
    }
}


print(Solution1().lengthOfLongestSubstring("abcabcbb"))
